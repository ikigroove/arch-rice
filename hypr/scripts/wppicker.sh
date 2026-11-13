#!/usr/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

IFS=$'\n'

# Выбор обоев
SELECTED_WALL=$(for a in $(ls -t *.jpg *.png *.gif *.jpeg 2>/dev/null); do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -p "")
[ -z "$SELECTED_WALL" ] && exit 0
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

# Установка обоев через awww
awww img "$SELECTED_PATH" --transition-type center

# Удаляем старый файл/линк и делаем жесткий линк или копию
rm -f "$SYMLINK_PATH"
cp "$SELECTED_PATH" "$SYMLINK_PATH"

# Генерация темы Matugen (обновит и colors.conf для hyprlock, и colors.lua для hyprland)
matugen image "$SYMLINK_PATH" -m dark --type scheme-tonal-spot --source-color-index 0
