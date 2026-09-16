#!/bin/bash

DEVICE="/org/freedesktop/UPower/devices/headset_dev_98_67_2E_54_D9_E6"
PERCENTAGE=$(upower -i "$DEVICE" 2>/dev/null | awk '/percentage/ {gsub("%", "", $2); print $2}')

if [[ -z "$PERCENTAGE" ]]; then
  echo '{"text": "󰋎", "tooltip": "Sin conexión"}'
  exit 0
fi

if [[ "$PERCENTAGE" -le 15 ]]; then
  echo '{"text": "", "tooltip": "Audífonos: '"$PERCENTAGE"'%"}'
elif [[ "$PERCENTAGE" -le 35 ]]; then
  echo '{"text": "", "tooltip": "Audífonos: '"$PERCENTAGE"'%"}'
elif [[ "$PERCENTAGE" -le 65 ]]; then
  echo '{"text": "", "tooltip": "Audífonos: '"$PERCENTAGE"'%"}'
elif [[ "$PERCENTAGE" -le 95 ]]; then
  echo '{"text": "", "tooltip": "Audífonos: '"$PERCENTAGE"'%"}'
else
  echo '{"text": "", "tooltip": "Audífonos: '"$PERCENTAGE"'%"}'
fi
