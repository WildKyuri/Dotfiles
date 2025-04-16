#!/bin/bash

while true; do
  cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
  echo "%{F#ffb4f3} %{F#ffffff}$cpu"
  sleep 2
done
