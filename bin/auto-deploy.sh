#!/usr/bin/env bash

# ==============================================================================
# Script de Monitoramento e Auto-Deploy (Polling / Cron Job)
# Projeto: III CONTEC MATOPIBA
# ==============================================================================

# Diretórios
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Configurações
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

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "${LOG_FILE}"
}

# 1. Garantir que apenas uma instância seja executada por vez
exec 200>"${LOCK_FILE}"
if ! flock -n 200; then
    log "WARN: Um processo de deploy/build já está em execução. Aguardando a próxima verificação."
    exit 0
fi

cd "${REPO_DIR}" || { log "ERROR: Não foi possível acessar ${REPO_DIR}"; exit 1; }

# 2. Buscar atualizações no GitHub sem alterar o repositório local ainda
git fetch origin "${BRANCH}" --quiet 2>>"${LOG_FILE}"

LOCAL_HASH=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse "origin/${BRANCH}")

# 3. Verificar se há alterações (a menos que --force seja usado)
if [ "${LOCAL_HASH}" = "${REMOTE_HASH}" ] && [ "${FORCE_BUILD}" != "true" ]; then
    # Se for executado manualmente no terminal (TTY), mostra mensagem informativa e dica
    if [ -t 1 ]; then
        echo "✅ Repositório já está atualizado no commit (${LOCAL_HASH:0:7}). Nenhuma alteração pendente."
        echo "💡 Dica: Use './bin/auto-deploy.sh --force' para forçar a reconstrução/deploy do site."
    fi
    exit 0
fi

if [ "${FORCE_BUILD}" = "true" ]; then
    log "========================================================"
    log "⚡ REBUILD FORÇADO SOLICITADO VIA LINHA DE COMANDO (--force)"
    log "Commit Atual: ${LOCAL_HASH:0:7}"
    log "========================================================"
else
    log "========================================================"
    log "🚀 NOVA ATUALIZAÇÃO DETECTADA no GitHub!"
    log "Commit Local:  ${LOCAL_HASH:0:7}"
    log "Commit Remoto: ${REMOTE_HASH:0:7}"
    log "========================================================"
fi

# 4. Atualizar o código local
log "📥 Baixando alterações do repositório (git pull origin ${BRANCH})..."
if ! git pull origin "${BRANCH}" >>"${LOG_FILE}" 2>&1; then
    log "❌ ERRO: Falha ao executar 'git pull'."
    exit 1
fi

# 5. Executar o Build da aplicação
log "🔨 Iniciando compilação/deploy da produção..."

if command -v docker &>/dev/null && command -v docker compose &>/dev/null && [ -f "docker-compose.yml" ]; then
    log "🐳 Detectado Docker Compose. Recriando contêineres..."
    docker compose up -d --build >>"${LOG_FILE}" 2>&1
    log "✅ Contêineres Docker atualizados e reiniciados com sucesso!"
elif command -v bundle &>/dev/null; then
    log "💎 Detectado ambiente Ruby/Jekyll local. Compilando site..."
    JEKYLL_ENV=production bundle exec jekyll build >>"${LOG_FILE}" 2>&1
    log "✅ Build do Jekyll concluído em _site/!"
else
    log "⚠️ AVISO: Código atualizado, mas nem Docker nem Bundle foram encontrados no PATH para recriar o site."
fi

# 6. Sincronização atômica via rsync com a pasta pública do Nginx/Apache
if [ -n "${TARGET_WEB_DIR}" ] && [ -d "_site" ]; then
    log "🔄 Sincronizando arquivos compilados (_site/) com ${TARGET_WEB_DIR} via rsync..."
    rsync -av --delete --chown=www-data:www-data _site/ "${TARGET_WEB_DIR}/" >>"${LOG_FILE}" 2>&1
    log "✅ Sincronização via rsync para ${TARGET_WEB_DIR} concluída!"
fi

log "🎉 Deploy concluído com sucesso para o commit: $(git rev-parse --short HEAD)"
log "========================================================"

exit 0
