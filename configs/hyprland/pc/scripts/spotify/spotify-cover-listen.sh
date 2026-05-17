#!/usr/bin/env bash

CACHE_DIR="/tmp/eww-spotify"
URL_FILE="$CACHE_DIR/cover.url"
IMG_FILE="$CACHE_DIR/cover.jpg"

mkdir -p "$CACHE_DIR"

playerctl --player=spotify metadata --follow --format '{{mpris:artUrl}}' 2>/dev/null |
  while read -r url; do
    [ -z "$url" ] && continue

    old_url=""
    [ -f "$URL_FILE" ] && old_url="$(cat "$URL_FILE")"

    if [ "$url" != "$old_url" ] || [ ! -f "$IMG_FILE" ]; then
      if [[ "$url" == file://* ]]; then
        img="${url#file://}"
        echo "$url" >"$URL_FILE"
        echo "$img"
      else
        curl -L -s "$url" -o "$IMG_FILE"
        echo "$url" >"$URL_FILE"
        echo "$IMG_FILE"
      fi
    else
      echo "$IMG_FILE"
    fi
  done
