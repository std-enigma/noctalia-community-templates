#!/usr/bin/env bash
set -euo pipefail

config_file="$HOME/.pi/agent/settings.json"

mkdir -p "$(dirname "$config_file")"

if [ ! -f "$config_file" ]; then
    echo '{"theme": "noctalia"}' > "$config_file"
    exit 0
fi

if grep -q '"theme"' "$config_file"; then
    sed -i 's/"theme"[[:space:]]*:[[:space:]]*"[^"]*"/"theme": "noctalia"/' "$config_file"
else
    sed -i '1s/{/{\n  "theme": "noctalia",/' "$config_file"
fi