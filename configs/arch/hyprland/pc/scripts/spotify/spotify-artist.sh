#!/usr/bin/env bash

playerctl --player=spotify metadata --follow --format '{{artist}}' 2>/dev/null |
  while read -r artist; do
    echo "${artist:-─}"
  done
