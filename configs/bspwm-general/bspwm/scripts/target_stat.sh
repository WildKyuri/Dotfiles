#!/bin/bash

ip_address=$(/bin/cat /home/kyuri/.config/bin/target | awk '{print $1}')
machine_name=$(/bin/cat /home/kyuri/.config/bin/target | awk '{print $2}')

if [ $ip_address ] && [ $machine_name ]; then
  echo "%{F#e51d0b}󰓾 %{F#ffffff}$ip_address%{u-} - $machine_name"
else
  echo "%{F#ffb4f3} %{u-}%{F#ffffff} No target"
fi
