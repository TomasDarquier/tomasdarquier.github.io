#!/bin/bash

set -euo pipefail

SITE_DIR="_amsf/_site"

# Lista blanca de archivos/carpetas que deben preservarse
PROTEGER=(
  ".git"
  ".gitignore"
  "node_modules"
  "_amsf"
  "publish.sh"  # el nombre del script actual
)

# Verificar existencia de la carpeta _site
if [ ! -d "$SITE_DIR" ]; then
  echo "❌ La carpeta $SITE_DIR no existe."
  exit 1
fi

echo "🧹 Limpiando raíz del repositorio (excepto protegidos)..."

# Convertir lista de protección a patrón de búsqueda
for item in * .*; do
  skip=false
  for protected in "${PROTEGER[@]}"; do
    if [[ "$item" == "$protected" ]]; then
      skip=true
      break
    fi
  done

  if [[ "$skip" == false ]]; then
    rm -rf "$item"
  fi
done

echo "🚚 Moviendo contenido de $SITE_DIR a la raíz del repositorio..."

# Mover el contenido del sitio
find "$SITE_DIR" -mindepth 1 -maxdepth 1 -exec mv -f {} ./ \;

echo "✅ ¡Contenido movido exitosamente y entorno seguro!"

