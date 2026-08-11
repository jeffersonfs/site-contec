#!/usr/bin/env bash

# ==============================================================================
# Script de Monitoramento, Auto-Deploy e Validação de Produção
# Projeto: III CONTEC MATOPIBA
# ==============================================================================

# Garantir PATH completo para Cron e ambientes não-interativos
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

BRANCH="main"
FORCE_BUILD="${FORCE_BUILD:-false}"
TARGET_WEB_DIR="${TARGET_WEB_DIR:-}" # Ex: /var/www/html ou /var/www/site-contec
LOCK_FILE="/tmp/site-contec-deploy.lock"
LOG_FILE="${REPO_DIR}/deploy.log"

# Processar argumentos da linha de comando
for arg in "$@"; do
    case $arg in
        --force|-f|force)
            FORCE_BUILD=true
            ;;
        *)
            if [[ ! "$arg" =~ ^-- ]]; then
                BRANCH="$arg"
            fi
            ;;
    esac
done

# Função de log com saída espelhada no terminal
log() {
    local MSG="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "$MSG" >> "${LOG_FILE}"
    if [ -t 1 ]; then
        echo -e "$1"
    fi
}

# 1. Trava de segurança (evitar execuções simultâneas)
exec 200>"${LOCK_FILE}"
if ! flock -n 200; then
    log "⚠️ WARN: Um processo de deploy/build já está em execução neste momento."
    exit 0
fi

cd "${REPO_DIR}" || { log "❌ ERROR: Não foi possível acessar ${REPO_DIR}"; exit 1; }

# 2. Buscar atualizações no repositório remoto (GitHub)
if [ -t 1 ]; then
    echo "🔍 Verificando atualizações no repositório remoto (origin/${BRANCH})..."
fi
git fetch origin "${BRANCH}" --quiet 2>>"${LOG_FILE}"

LOCAL_HASH=$(git rev-parse HEAD 2>/dev/null)
REMOTE_HASH=$(git rev-parse "origin/${BRANCH}" 2>/dev/null)

# 3. Verificar se há alterações
if [ "${LOCAL_HASH}" = "${REMOTE_HASH}" ] && [ "${FORCE_BUILD}" != "true" ]; then
    if [ -t 1 ]; then
        echo "========================================================"
        echo "✅ O código local já está atualizado com o GitHub (commit ${LOCAL_HASH:0:7})."
        echo "ℹ️  Nenhuma nova alteração detectada."
        echo ""
        echo "👉 Para forçar a recompilação, validação e rsync do site, rode:"
        echo "   ./bin/auto-deploy.sh --force"
        echo "========================================================"
    fi
    exit 0
fi

if [ "${FORCE_BUILD}" = "true" ]; then
    log "========================================================"
    log "⚡ REBUILD E DEPLOY FORÇADO INICIADO (--force)"
    log "Commit Atual: ${LOCAL_HASH:0:7}"
    log "========================================================"
else
    log "========================================================"
    log "🚀 NOVA ATUALIZAÇÃO DETECTADA NO GITHUB!"
    log "Commit Local:  ${LOCAL_HASH:0:7}"
    log "Commit Remoto: ${REMOTE_HASH:0:7}"
    log "========================================================"
fi

# 4. Atualizar o repositório local (git pull)
log "📥 Baixando alterações do repositório (git pull origin ${BRANCH})..."
PULL_OUTPUT=$(git pull origin "${BRANCH}" 2>&1)
PULL_STATUS=$?
echo "${PULL_OUTPUT}" >> "${LOG_FILE}"

if [ $PULL_STATUS -ne 0 ]; then
    log "❌ ERRO CRÍTICO ao executar 'git pull':"
    log "${PULL_OUTPUT}"
    exit 1
fi
log "✅ Código-fonte atualizado com sucesso para o commit: $(git rev-parse --short HEAD)"

# 5. Limpeza preparatória para garantir validação real do build
log "🧹 Removendo pasta '_site' antiga para validação de compilação..."
rm -rf _site

# 6. Executar o Build do Jekyll
log "🔨 Iniciando compilação do site Jekyll..."

if command -v docker &>/dev/null && [ -f "docker-compose.yml" ]; then
    log "🐳 Detectado Docker Compose. Garantindo contêiner ativo e rodando build..."
    if command -v docker-compose &>/dev/null; then
        DOCKER_CMD="docker-compose"
    else
        DOCKER_CMD="docker compose"
    fi
    
    ${DOCKER_CMD} up -d >>"${LOG_FILE}" 2>&1
    
    log "⏳ Compilando Jekyll dentro do contêiner Docker..."
    ${DOCKER_CMD} exec -T jekyll bundle exec jekyll build --destination /srv/jekyll/_site 2>&1 | tee -a "${LOG_FILE}"
    
    # Se o volume mount não espelhou para o host, copiar do contêiner
    if [ ! -f "_site/index.html" ]; then
        CONTAINER_ID=$(${DOCKER_CMD} ps -q jekyll 2>/dev/null)
        if [ -n "${CONTAINER_ID}" ]; then
            log "📦 Extraindo arquivos compilados (_site) do contêiner Docker..."
            docker cp "${CONTAINER_ID}:/tmp/_site" ./_site 2>>"${LOG_FILE}"
        fi
    fi
elif command -v bundle &>/dev/null; then
    log "💎 Compilando via Jekyll local (bundle exec jekyll build)..."
    JEKYLL_ENV=production bundle exec jekyll build --destination _site 2>&1 | tee -a "${LOG_FILE}"
else
    log "⚠️ AVISO: Nem Docker nem Bundle/Jekyll foram encontrados no PATH do servidor."
fi

# ==============================================================================
# VALIDAÇÃO RIGOROSA DA CRIAÇÃO DO _SITE
# ==============================================================================
if [ ! -d "_site" ] || [ ! -f "_site/index.html" ]; then
    log "❌ ERRO CRÍTICO DE BUILD: A pasta '_site' ou '_site/index.html' NÃO foi gerada!"
    log "O build falhou e o rsync foi ABORTADO para proteger a produção."
    exit 1
fi

SIZE_SITE=$(du -sh _site 2>/dev/null | cut -f1)
log "✅ BUILD VALIDADOM COM SUCESSO! A pasta '_site' foi criada/atualizada (Tamanho: ${SIZE_SITE}, index.html OK)."

# ==============================================================================
# CONFIGURAÇÃO, SINCRONIZAÇÃO E VALIDAÇÃO DO RSYNC
# ==============================================================================
if [ -z "${TARGET_WEB_DIR}" ]; then
    if [ -d "/var/www/site-contec" ]; then
        TARGET_WEB_DIR="/var/www/site-contec"
    elif [ -d "/var/www/html" ]; then
        TARGET_WEB_DIR="/var/www/html"
    fi
fi

if [ -z "${TARGET_WEB_DIR}" ]; then
    log "⚠️ AVISO: O site foi compilado com sucesso em '_site/', mas NENHUMA pasta de destino do Nginx/Apache (TARGET_WEB_DIR) foi especificada."
    log "Para sincronizar automaticamente via rsync com seu webserver, execute:"
    log "   TARGET_WEB_DIR=\"/var/www/sua-pasta-web\" ./bin/auto-deploy.sh --force"
    exit 0
fi

if [ ! -d "${TARGET_WEB_DIR}" ]; then
    log "❌ ERRO DE DESTINO: A pasta de destino do servidor '${TARGET_WEB_DIR}' não existe!"
    exit 1
fi

log "🔄 Sincronizando '_site/' -> '${TARGET_WEB_DIR}' via rsync..."
if command -v rsync &>/dev/null; then
    rsync -av --delete _site/ "${TARGET_WEB_DIR}/" 2>&1 | tee -a "${LOG_FILE}"
    RSYNC_STATUS=${PIPESTATUS[0]}
else
    log "🔄 rsync não encontrado, copiando arquivos via cp -r..."
    cp -r _site/* "${TARGET_WEB_DIR}/" 2>>"${LOG_FILE}"
    RSYNC_STATUS=$?
fi

# Validação final do destino
if [ $RSYNC_STATUS -eq 0 ] && [ -f "${TARGET_WEB_DIR}/index.html" ]; then
    TARGET_SIZE=$(du -sh "${TARGET_WEB_DIR}" 2>/dev/null | cut -f1)
    log "========================================================"
    log "🎉 DEPLOY E SINCRONIZAÇÃO VERIFICADOS COM SUCESSO!"
    log "📁 Pasta de Produção: ${TARGET_WEB_DIR} (Tamanho: ${TARGET_SIZE})"
    log "📄 Confirmado: ${TARGET_WEB_DIR}/index.html está atualizado!"
    log "========================================================"
else
    log "❌ ERRO CRÍTICO NA SINCRONIZAÇÃO: Falha no rsync ou '${TARGET_WEB_DIR}/index.html' não encontrado!"
    exit 1
fi

exit 0
