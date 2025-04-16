#!/bin/bash

while true; do
  ram=$(free | awk '/Mem:/ {printf "%.0f%\n", $3/$2 * 100}')
  echo "%{F#ffb4f4} %{F#ffffff}$ram"
  sleep 2
done
