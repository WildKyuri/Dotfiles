#!/bin/bash
DATA=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits 2>/dev/null)
GPU=$(echo "$DATA" | awk -F',' '{gsub(" ", "", $1); print $1}')
TEMP=$(echo "$DATA" | awk -F',' '{gsub(" ", "", $2); print $2}')

if [[ -z "$GPU" || -z "$TEMP" ]]; then
  echo '{"text": "󰢮 ", "tooltip": "GPU: N/A"}'
  exit 0
fi

echo '{"text": "󰢮 ", "tooltip": "GPU: '"$GPU"'% | Temp: '"$TEMP"'°C"}'
