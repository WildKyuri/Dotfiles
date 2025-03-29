#!/bin/bash

THRESHOLD=15
FULL_BATTERY=100
CHECK_INTERVAL=60

BATTERY_PATH="/sys/class/power_supply/BAT0"
[ ! -d "$BATTERY_PATH" ] && BATTERY_PATH="/sys/class/power_supply/BAT1"

ICONS=(" " " " " " " " " ") # Iconos Nerd Fonts

# while true; do
BATTERY_LEVEL=$(cat "$BATTERY_PATH"/capacity 2>/dev/null || echo 100)
STATUS=$(cat "$BATTERY_PATH"/status 2>/dev/null || echo "Desconocido")

# Selección de icono
if [[ $BATTERY_LEVEL -le 15 ]]; then
  ICON=${ICONS[0]}
elif [[ $BATTERY_LEVEL -le 35 ]]; then
  ICON=${ICONS[1]}
elif [[ $BATTERY_LEVEL -le 65 ]]; then
  ICON=${ICONS[2]}
elif [[ $BATTERY_LEVEL -le 95 ]]; then
  ICON=${ICONS[3]}
else
  ICON=${ICONS[4]}
fi

# Icono de carga/descarga
if [[ "$STATUS" == "Charging" ]]; then
  CHARGE_ICON="󰂄"
else
  CHARGE_ICON=""
fi

# Salida en formato texto con color (igual que el de temperatura)
echo "${ICON} ${BATTERY_LEVEL}%"

#   sleep $CHECK_INTERVAL
# done
