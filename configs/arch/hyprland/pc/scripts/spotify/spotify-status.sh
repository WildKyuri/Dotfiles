#!/usr/bin/env bash

playerctl --player=spotify status --follow 2>/dev/null |
  while read -r status; do
    echo "${status:-Stopped}"
  done
