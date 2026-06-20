#!/usr/bin/env bash

playerctl --player=spotify metadata --follow --format '{{title}}' 2>/dev/null |
  while read -r title; do
    echo "${title:-Sin música}"
  done
