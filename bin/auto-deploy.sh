#!/usr/bin/env bash

# ==============================================================================
# Script de Monitoramento e Auto-Deploy para Produção
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

# Função de log com saída espelhada no terminal quando executado manualmente
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
        echo "ℹ️  Nada a ser atualizado."
        echo ""
        echo "👉 Para forçar a recompilação e o deploy imediato mesmo sem novos commits, rode:"
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
    log "❌ ERRO ao executar 'git pull':"
    log "${PULL_OUTPUT}"
    exit 1
fi
log "✅ Código-fonte atualizado com sucesso!"

# 5. Executar a compilação / build
log "🔨 Iniciando compilação do site..."

BUILD_SUCCESS=false

# Estratégia A: Docker Compose
if command -v docker &>/dev/null && [ -f "docker-compose.yml" ]; then
    log "🐳 Executando build via Docker Compose..."
    if command -v docker-compose &>/dev/null; then
        DOCKER_CMD="docker-compose"
    else
        DOCKER_CMD="docker compose"
    fi
    
    if [ -t 1 ]; then
        ${DOCKER_CMD} up -d --build | tee -a "${LOG_FILE}"
        DOCKER_STATUS=${PIPESTATUS[0]}
    else
        ${DOCKER_CMD} up -d --build >>"${LOG_FILE}" 2>&1
        DOCKER_STATUS=$?
    fi

    if [ $DOCKER_STATUS -eq 0 ]; then
        log "✅ Contêineres Docker atualizados e em execução!"
        BUILD_SUCCESS=true
    else
        log "❌ ERRO durante o build do Docker Compose."
    fi
# Estratégia B: Bundle / Jekyll local
elif command -v bundle &>/dev/null; then
    log "💎 Compilando via Jekyll local (bundle exec jekyll build)..."
    if [ -t 1 ]; then
        JEKYLL_ENV=production bundle exec jekyll build | tee -a "${LOG_FILE}"
        JEKYLL_STATUS=${PIPESTATUS[0]}
    else
        JEKYLL_ENV=production bundle exec jekyll build >>"${LOG_FILE}" 2>&1
        JEKYLL_STATUS=$?
    fi

    if [ $JEKYLL_STATUS -eq 0 ]; then
        log "✅ Build do Jekyll gerado em _site/!"
        BUILD_SUCCESS=true
    else
        log "❌ ERRO durante a compilação do Jekyll."
    fi
else
    log "⚠️ AVISO: Nem Docker nem Bundle/Jekyll foram encontrados no servidor."
    log "Tentando verificar se a pasta _site/ pré-compilada existe..."
    if [ -d "_site" ]; then
        BUILD_SUCCESS=true
    fi
fi

# 6. Autodetectar pasta de destino Web se não especificada
if [ -z "${TARGET_WEB_DIR}" ]; then
    if [ -d "/var/www/site-contec" ]; then
        TARGET_WEB_DIR="/var/www/site-contec"
    elif [ -d "/var/www/html" ]; then
        TARGET_WEB_DIR="/var/www/html"
    fi
fi

# 7. Sincronização rsync para a pasta do Nginx/Apache (se aplicável)
if [ -n "${TARGET_WEB_DIR}" ] && [ -d "_site" ]; then
    log "🔄 Sincronizando arquivos de _site/ para ${TARGET_WEB_DIR} via rsync..."
    if command -v rsync &>/dev/null; then
        RSYNC_OUT=$(rsync -av --delete _site/ "${TARGET_WEB_DIR}/" 2>&1)
        RSYNC_STATUS=$?
        echo "${RSYNC_OUT}" >> "${LOG_FILE}"
        if [ $RSYNC_STATUS -eq 0 ]; then
            log "✅ Sincronização web para ${TARGET_WEB_DIR} concluída com sucesso!"
        else
            log "⚠️ Falha ao executar rsync para ${TARGET_WEB_DIR}:"
            log "${RSYNC_OUT}"
        fi
    else
        log "🔄 rsync não encontrado, copiando arquivos via cp -r..."
        cp -r _site/* "${TARGET_WEB_DIR}/" 2>>"${LOG_FILE}"
        log "✅ Arquivos copiados para ${TARGET_WEB_DIR}!"
    fi
fi

log "🎉 DEPLOY CONCLUÍDO COM SUCESSO! Commit atual: $(git rev-parse --short HEAD)"
log "========================================================"

exit 0
