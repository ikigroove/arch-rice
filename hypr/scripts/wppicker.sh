#!/usr/bin/bash

# === CONFIG ===
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
COPY_PATH="$HOME/.config/hypr/current_wallpaper"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

IFS=$'\n'

# === Выбор обоев ===
SELECTED_WALL=$(for a in $(ls -t *.jpg *.png *.gif *.jpeg 2>/dev/null); do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -p "")
[ -z "$SELECTED_WALL" ] && exit 1
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

# === Установка обоев через awww ===
awww img "$SELECTED_PATH" --transition-type center

# === Копируем файл в фиксированное место, сохраняя расширение ===
EXT="${SELECTED_WALL##*.}"   # извлекаем расширение (jpg, png, ...)
COPY_WITH_EXT="$HOME/.config/hypr/current_wallpaper.$EXT"
cp "$SELECTED_PATH" "$COPY_WITH_EXT"
ln -sf "$COPY_WITH_EXT" "$SYMLINK_PATH"

# === Генерируем тему через matugen, используя скопированный файл ===
matugen image "$COPY_WITH_EXT" -m dark --type scheme-tonal-spot --source-color-index 0

