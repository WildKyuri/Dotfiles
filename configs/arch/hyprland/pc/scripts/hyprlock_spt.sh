#!/bin/bash

# Forzar a usar exclusivamente Spotify
playerctl_status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$playerctl_status" == "Playing" ]; then
  artist=$(playerctl --player=spotify metadata artist)
  title=$(playerctl --player=spotify metadata title)
  echo "  $title - $artist"
elif [ "$playerctl_status" == "Paused" ]; then
  artist=$(playerctl --player=spotify metadata artist)
  title=$(playerctl --player=spotify metadata title)
  echo "  $title - $artist"
else
  echo " Nada reproduciéndose"
fi
