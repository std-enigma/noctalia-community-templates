#!/usr/bin/env bash
set -euo pipefail

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
config_file="$config_dir/fuzzel/fuzzel.ini"
include_line="include=$config_dir/fuzzel/themes/noctalia"

mkdir -p "$(dirname "$config_file")"

if [ ! -f "$config_file" ]; then
    echo "$include_line" >"$config_file"
elif grep -q "^$include_line$" "$config_file"; then
    :
elif grep -q '^include=.*themes' "$config_file"; then
    sed -i 's|^include=.*themes.*|'"$include_line"'|' "$config_file"
else
    echo "$include_line" >>"$config_file"
fi
