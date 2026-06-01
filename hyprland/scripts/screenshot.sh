#!/usr/bin/env bash
# Screenshot in stile omarchy: grim + slurp + satty
# Uso: screenshot.sh [output|window|region]
#   output  -> monitor attualmente focalizzato
#   window  -> finestra attiva
#   region  -> selezione manuale (con overlay congelato via hyprpicker)
# Lo screenshot viene aperto in satty per l'annotazione, poi salvato e
# copiato negli appunti.
set -euo pipefail

mode="${1:-region}"
dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/screenshot-$(date +%Y%m%d-%H%M%S).png"

case "$mode" in
  output)
    geometry=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | "\(.x),\(.y) \(.width)x\(.height)"')
    ;;
  window)
    geometry=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    ;;
  region | *)
    # Congela lo schermo per una selezione più comoda, poi lo chiude
    hyprpicker -r -z &
    picker_pid=$!
    sleep 0.2
    if ! geometry=$(slurp); then
      kill "$picker_pid" 2>/dev/null || true
      exit 1
    fi
    kill "$picker_pid" 2>/dev/null || true
    ;;
esac

grim -g "$geometry" - | satty --filename - \
  --output-filename "$file" \
  --early-exit \
  --copy-command wl-copy
