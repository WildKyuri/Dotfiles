#!/usr/bin/env bash

STATE_FILE="/tmp/hypr-last-tiled-window"

ACTIVE_JSON=$(hyprctl activewindow -j)

ACTIVE_ADDR=$(echo "$ACTIVE_JSON" | jq -r '.address')
ACTIVE_FLOATING=$(echo "$ACTIVE_JSON" | jq -r '.floating')
ACTIVE_WORKSPACE=$(echo "$ACTIVE_JSON" | jq -r '.workspace.id')

if [[ -z "$ACTIVE_ADDR" || "$ACTIVE_ADDR" == "null" ]]; then
  exit 0
fi

if [[ "$ACTIVE_FLOATING" == "true" ]]; then
  if [[ -f "$STATE_FILE" ]]; then
    LAST_ADDR=$(cat "$STATE_FILE")

    if hyprctl clients -j | jq -e --arg addr "$LAST_ADDR" '.[] | select(.address == $addr)' >/dev/null; then
      hyprctl dispatch focuswindow "address:$LAST_ADDR"
      exit 0
    fi
  fi
fi

echo "$ACTIVE_ADDR" >"$STATE_FILE"

FLOATING_ADDR=$(hyprctl clients -j | jq -r --argjson ws "$ACTIVE_WORKSPACE" '
  .[]
  | select(.workspace.id == $ws)
  | select(.floating == true)
  | .address
' | head -n 1)

if [[ -n "$FLOATING_ADDR" && "$FLOATING_ADDR" != "null" ]]; then
  hyprctl dispatch focuswindow "address:$FLOATING_ADDR"
fi
