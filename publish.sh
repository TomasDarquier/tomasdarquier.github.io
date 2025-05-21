#!/bin/bash

set -e

SITE_DIR="_amsf/_site"

if [ ! -d "$SITE_DIR" ]; then
  echo "❌ La carpeta $SITE_DIR no existe."
  exit 1
fi

echo "🚚 Moviendo contenido de $SITE_DIR a la raíz del repositorio..."

find "$SITE_DIR" -mindepth 1 -maxdepth 1 -exec mv -f {} ./ \;

echo "✅ ¡Contenido movido exitosamente!"

