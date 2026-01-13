DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "🚀 Iniciando backup do n8n..."

cd /exports || exit 1

# Garante que a pasta existe (sem erro se já existir)
mkdir -p workflows

echo "📦 Exportando workflows..."
n8n export:workflow --all --output=workflows

echo "📝 Commitando alterações..."
git add .
git commit -m "Backup n8n - $DATE" || echo "⚠️ Nada novo para commitar"

echo "☁️ Enviando para o GitHub..."
git push

echo "✅ Backup concluído com sucesso!"


              
























