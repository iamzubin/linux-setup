#!/bin/zsh

WALLPAPER_DIR="$HOME/Pictures/"
wallpapers=("${(@f)$(ls -1 "$WALLPAPER_DIR" | sort)}")

# If directory is empty, just exit
[[ ${#wallpapers} -eq 0 ]] && exit 1

index_file="$HOME/.cache/wallpaper_index"
[[ -f $index_file ]] || echo 0 > $index_file

current_index=$(cat $index_file)
next_index=$(( (current_index + 1) % ${#wallpapers} ))
echo $next_index > $index_file

next_wall="$WALLPAPER_DIR/${wallpapers[$next_index]}"
wallust.sh "$next_wall"
