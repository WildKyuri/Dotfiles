#!/bin/bash

TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

if [ "$TEMP" -lt 50 ]; then
  ICON=""
  COLOR="#00FF00" # Verde
elif [ "$TEMP" -ge 50 ] && [ "$TEMP" -lt 60 ]; then
  ICON=""
  COLOR="#00FF00" # Verde (aún por debajo de 60)
elif [ "$TEMP" -ge 60 ] && [ "$TEMP" -lt 75 ]; then
  ICON=""
  COLOR="#FFFF00" # Amarillo
else
  ICON="󰢵 "
  COLOR="#FF0000" # Rojo
fi

# echo "󰘸 $TEMP°C"
echo "<span color='$COLOR'>${ICON} ${TEMP}°C</span>"
