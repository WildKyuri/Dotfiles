#!/bin/bash

choice=$(printf "OpenCode — ChatGPT\nClaude — Qwen 3.5 4B Local" |
  rofi -dmenu -i -p "AI")

case "$choice" in
"OpenCode — ChatGPT")
  kitty -e opencode
  ;;

"Claude — Qwen 3.5 4B Local")
  kitty -e ollama launch claude --model qwen3.5:4b
  ;;
esac
