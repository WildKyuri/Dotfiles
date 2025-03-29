#!/bin/bash

THRESHOLD=15
FULL_BATTERY=100
CHECK_INTERVAL=60

BATTERY_PATH="/sys/class/power_supply/BAT0"
[ ! -d "$BATTERY_PATH" ] && BATTERY_PATH="/sys/class/power_supply/BAT1"

ICONS=("" "" "" "" "") # Iconos Nerd Fonts

while true; do
  BATTERY_LEVEL=$(cat "$BATTERY_PATH"/capacity 2>/dev/null || echo 100)
  STATUS=$(cat "$BATTERY_PATH"/status 2>/dev/null || echo "Desconocido")

  # Selección de icono
  if [[ $BATTERY_LEVEL -le 15 ]]; then
    ICON=${ICONS[0]}
    COLOR="#FF0000" # Rojo
  elif [[ $BATTERY_LEVEL -le 35 ]]; then
    ICON=${ICONS[1]}
    COLOR="#FFFF00" # Amarillo
  elif [[ $BATTERY_LEVEL -le 65 ]]; then
    ICON=${ICONS[2]}
    COLOR="#FFFFFF" # Blanco
  elif [[ $BATTERY_LEVEL -le 95 ]]; then
    ICON=${ICONS[3]}
    COLOR="#00FF00" # Verde
  else
    ICON=${ICONS[4]}
    COLOR="#00FF00" # Verde
  fi

  # Icono de carga/descarga
  if [[ "$STATUS" == "Charging" ]]; then
    CHARGE_ICON="󰂄"
  else
    CHARGE_ICON=""
  fi

  # Salida en formato texto con color (igual que el de temperatura)
  echo -e "<span color='$COLOR'>${ICON} ${BATTERY_LEVEL}% ${CHARGE_ICON}</span>"

  # Notificaciones (opcional)
  # Verifica si la batería está por debajo del umbral y no está cargando
  if [[ "$BATTERY_LEVEL" -le "$THRESHOLD" && "$STATUS" != "Charging" ]]; then
    notify-send -u critical "Batería baja" "Nivel de batería: $BATTERY_LEVEL% $ICON"
  fi

  # Verifica si la batería está al 100% y está cargando
  if [[ "$BATTERY_LEVEL" -eq "$FULL_BATTERY" && "$STATUS" == "Charging" ]]; then
    notify-send -u normal "Batería completa" "La batería ha alcanzado el 100% "
  fi

  # Notificación cuando se enchufa la laptop
  if [[ "$STATUS" == "Charging" && "$PREV_STATUS" != "Charging" ]]; then
    notify-send -u normal "Cargando" "La laptop está conectada a la corriente ⚡"
  fi

  PREV_STATUS="$STATUS"

  sleep $CHECK_INTERVAL
done
