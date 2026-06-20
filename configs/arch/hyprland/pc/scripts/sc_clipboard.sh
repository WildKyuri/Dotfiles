#!/bin/bash
# Captura una región de la pantalla y la copia al portapapeles

# Capturar la región seleccionada
REGION=$(slurp)

# Verificar si se canceló la selección
if [ -z "$REGION" ]; then
  notify-send "Captura cancelada" "No se copió ninguna imagen al portapapeles."
  exit 1
fi

# Capturar la imagen y copiar al portapapeles
grim -g "$REGION" - | wl-copy

# Notificar al usuario
notify-send "Captura copiada" "La captura se ha copiado al portapapeles."
