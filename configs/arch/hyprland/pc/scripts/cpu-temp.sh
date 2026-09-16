#!/bin/bash

TEMP=$(sensors | grep 'Tctl' | awk '{print $2}' | sed 's/+//g' | cut -d'.' -f1)
# USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

if [ "$TEMP" -lt 50 ]; then
  ICON=""
  COLOR="#00FF00" # Verde
elif [ "$TEMP" -ge 50 ] && [ "$TEMP" -lt 60 ]; then
  ICON=""
  COLOR="#00FF00" # Verde (aún por debajo de 60)
elif [ "$TEMP" -ge 60 ] && [ "$TEMP" -lt 75 ]; then
  ICON=""
  COLOR="#FFFF00" # Amarillo
else
  ICON=""
  COLOR="#FF0000" # Rojo
fi

# Formato con color para Waybar (usando Pango markup)
# echo " ${USAGE}% <span color='$COLOR'>${ICON}${TEMP}°C</span>"
echo "<span color='$COLOR'>${ICON}${TEMP}°C</span>"
