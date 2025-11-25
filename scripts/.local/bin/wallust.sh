#!/bin/zsh

staticwall="$HOME/.local/state/wallpaper"

if [ -z "$1" ]; then
  echo "add wallpaper as arg"
  exit 1
fi

wallust run "$1" -b wal &

ln -sf "$1" "$staticwall"
hyprctl hyprpaper reload ,"$1"
