#!/bin/bash

killall waybar

# waybar -s $HOME/.config/waybar/styles.css &
waybar -c ~/.config/waybar/config-left.jsonc -s $HOME/.config/waybar/styles.css &
waybar -c ~/.config/waybar/config-center.jsonc -s $HOME/.config/waybar/styles-center.css &
waybar -c ~/.config/waybar/config-right.jsonc -s $HOME/.config/waybar/styles.css &
