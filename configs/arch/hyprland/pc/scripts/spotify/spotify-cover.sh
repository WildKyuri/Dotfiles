#!/usr/bin/env bash

CACHE_DIR="/tmp/eww-spotify"
URL_FILE="$CACHE_DIR/cover.url"
IMG_FILE="$CACHE_DIR/cover.jpg"

mkdir -p "$CACHE_DIR"

url="$(playerctl --player=spotify metadata mpris:artUrl 2>/dev/null)"

[ -z "$url" ] && exit 0

old_url=""
[ -f "$URL_FILE" ] && old_url="$(cat "$URL_FILE")"

if [ "$url" != "$old_url" ] || [ ! -f "$IMG_FILE" ]; then
  curl -L -s "$url" -o "$IMG_FILE"
  echo "$url" >"$URL_FILE"
fi

echo "$IMG_FILE"
