#!/bin/bash

# Definir los archivos del sistema donde se almacena la información de la batería
BATTERY_PATH="/sys/class/power_supply/BAT0"
CAPACITY_FILE="$BATTERY_PATH/capacity"
STATUS_FILE="$BATTERY_PATH/status"

# Obtener el porcentaje de la batería
BATTERY_LEVEL=$(cat "$CAPACITY_FILE")
BATTERY_STATUS=$(cat "$STATUS_FILE")

# Elegir el ícono según el nivel de batería
if [ "$BATTERY_STATUS" == "Charging" ]; then
  ICON="" # Ícono de carga
elif [ "$BATTERY_LEVEL" -ge 90 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 80 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 70 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 60 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 50 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 40 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 30 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 20 ]; then
  ICON=""
elif [ "$BATTERY_LEVEL" -ge 10 ]; then
  ICON=""
else
  ICON="" # Nivel crítico
fi

# Mostrar el ícono y el porcentaje en Polybar
echo "$ICON $BATTERY_LEVEL%"
