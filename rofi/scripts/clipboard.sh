#!/usr/bin/env bash

TMP_DIR="/tmp/cliphist-rofi"
mkdir -p "$TMP_DIR"

cliphist list | while read -r line; do
    id=$(echo "$line" | awk '{print $1}')

    if cliphist decode <<< "$line" | file - | grep -q image; then
        img="$TMP_DIR/$id.png"

        cliphist decode <<< "$line" > "$img" 2>/dev/null
        magick "$img" -resize 256x256 "$img"

        echo -en "$line\x00icon\x1f$img\n"
    else
        echo "$line"
    fi
done | rofi -dmenu -i -p "Clipboard" | cliphist decode | wl-copy
