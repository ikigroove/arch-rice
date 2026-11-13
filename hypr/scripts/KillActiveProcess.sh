#!/usr/bin/bash

# Получаем PID активного окна через JSON
active_pid=$(hyprctl activewindow -j | jq -r '.pid // empty')

if [ -n "$active_pid" ] && [ "$active_pid" -gt 0 ] 2>/dev/null; then
    kill -9 "$active_pid"
fi
