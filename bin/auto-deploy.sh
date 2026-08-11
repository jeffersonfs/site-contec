#!/usr/bin/env bash

# ==============================================================================
# Script de Monitoramento e Auto-Deploy (Polling / Cron Job)
# Projeto: III CONTEC MATOPIBA
# ==============================================================================

# Diretórios
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Configurações
BRANCH="${1:-main}"
LOCK_FILE="/tmp/site-contec-deploy.lock"
LOG_FILE="${REPO_DIR}/deploy.log"

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

# 3. Verificar se há alterações
if [ "${LOCAL_HASH}" = "${REMOTE_HASH}" ]; then
    # Repositório já atualizado - sai silenciosamente sem log excessivo
    exit 0
fi

log "========================================================"
log "🚀 NOVA ATUALIZAÇÃO DETECTADA no GitHub!"
log "Commit Local:  ${LOCAL_HASH:0:7}"
log "Commit Remoto: ${REMOTE_HASH:0:7}"
log "========================================================"

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

log "🎉 Deploy concluído com sucesso para o commit: $(git rev-parse --short HEAD)"
log "========================================================"

exit 0
