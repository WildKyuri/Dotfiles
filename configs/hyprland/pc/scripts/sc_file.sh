#!/bin/bash
# Captura una región de la pantalla y la guarda en la carpeta Pictures con numeración secuencial

# Directorio donde se guardarán las capturas
DIRECTORIO="$HOME/Imágenes/Screenshots"

# Crear el directorio si no existe
mkdir -p "$DIRECTORIO"

# Contar el número de archivos de captura existentes
NUM_ARCHIVOS=$(ls "$DIRECTORIO"/Screenshot_*.png 2>/dev/null | wc -l)

# Calcular el número de la siguiente captura
NUM_SIGUIENTE=$((NUM_ARCHIVOS + 1))

# Si el número supera 50, reiniciar a 1
if [ "$NUM_SIGUIENTE" -gt 50 ]; then
  NUM_SIGUIENTE=1
fi

# Formatear el número a dos dígitos (01, 02, ..., 50)
NUM_FORMAT=$(printf "%02d" "$NUM_SIGUIENTE")

# Nombre del archivo de la captura
ARCHIVO="$DIRECTORIO/Screenshot_$NUM_FORMAT.png"

# Capturar la región seleccionada
REGION=$(slurp)

# Verificar si se canceló la selección
if [ -z "$REGION" ]; then
  notify-send "Captura cancelada" "No se tomó ninguna captura."
  exit 1
fi

# Tomar la captura y guardar en el archivo
grim -g "$REGION" "$ARCHIVO"

# Notificar al usuario
notify-send "Captura de pantalla guardada" "$ARCHIVO"
