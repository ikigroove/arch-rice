-- ~/.config/hypr/configs/keybinds.lua
local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

-- Запуск приложений
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(terminal, { float = true, size = { 800, 550 } }))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind("CTRL + ALT + Delete", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + CTRL + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Управление окнами dwindle
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Скрипты интерфейса
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/wbrestart.sh"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd('xdg-open "https://"'))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprlock.sh"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wppicker.sh"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("~/.config/hypr/scripts/KillActiveProcess.sh"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarStyles.sh"))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarLayout.sh"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("kitty yazi"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/rofi/scripts/clipboard.sh"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

-- Перемещение фокуса
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Перемещение окон
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ direction = "down" }))

-- Изменение размера окон через SUPER + ALT + Стрелки (обход аппаратного гостинга)
hl.bind(mainMod .. " + ALT + Left",  hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + Right", hl.dsp.window.resize({ x = 50,  y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + Up",    hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + Down",  hl.dsp.window.resize({ x = 0, y = 50,  relative = true }), { repeating = true })

-- Рабочие столы (1-10) и перенос окон
for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Прокрутка воркспейсов колесиком
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Работа с мышью (флаг mouse = true заменяет bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Мультимедиа клавиши (locked + repeating = bindel, locked = bindl)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --inc"),      { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --dec"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --toggle"),   { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --inc"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --dec"),  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
