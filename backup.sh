#!/bin/sh

TE=$(date +"%Y-%m-%d %H:%M:%S")

echo "🚀 Iniciando backup do n8n..."

mkdir -p workflows

echo "📦 Exportando workflows..."
n8n export:workflow --all --output=workflows

echo "📝 Commitando alterações..."
git add .
git commit -m "Backup n8n - $DATE" || echo "Nada para commitar"

echo "☁️ Enviando para o GitHub..."
git push

echo "✅ Backup concluído com sucesso!"




















              
























