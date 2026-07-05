#!/usr/bin/env bash

playerctl --player=spotify metadata --follow --format '{{album}}' 2>/dev/null |
  while read -r album; do
    echo "$album"
  done
