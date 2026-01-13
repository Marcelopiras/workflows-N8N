#!/bin/sh

echo "🚀 Iniciando backup do n8n..."

# Limpar e recriar diretório de workflows
echo "🧹 Limpando diretório antigo..."
rm -rf /exports/workflows
mkdir -p /exports/workflows

# Exportar workflows
echo "📦 Exportando workflows..."
n8n export:workflow --all --output=/exports/workflows/

# Verificar se a exportação foi bem-sucedida
if [ $? -ne 0 ]; then
    echo "❌ Erro ao exportar workflows!"
    exit 1
fi

# Git operations
cd /exports

# Configurar Git (caso necessário)
git config user.name "n8n-backup" 2>/dev/null || true
git config user.email "backup@n8n.local" 2>/dev/null || true

# Adicionar alterações
echo "📝 Commitando alterações..."
git add .
git commit -m "Backup n8n - $(date '+%Y-%m-%d %H:%M:%S')" || echo "⚠️ Nada para commitar"

# Push
echo "☁️ Enviando para o GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Backup concluído com sucesso!"
else
    echo "❌ Erro ao enviar para o GitHub!"
    exit 1
fi
