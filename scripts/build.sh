#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

SITES_FILE="$ROOT_DIR/sites.yml"
TEMPLATE_FILE="$ROOT_DIR/templates/index.template.html"
OUTPUT_FILE="$ROOT_DIR/public/index.html"

# Build the <li> list from sites.yml, then splice it into the template
# around the <!-- SITES --> placeholder.
{
  awk '/<!-- SITES -->/{exit} {print}' "$TEMPLATE_FILE"

  while IFS= read -r url; do
    display=$(printf '%s' "$url" | sed 's|https://||; s|/$||')
    printf '        <li><a href="%s">%s</a></li>\n' "$url" "$display"
  done < <(awk '/- https?:/{print $2}' "$SITES_FILE")

  awk '/<!-- SITES -->/{found=1; next} found{print}' "$TEMPLATE_FILE"
} > "$OUTPUT_FILE"

echo "Built: $OUTPUT_FILE"
