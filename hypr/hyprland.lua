-- ~/.config/hypr/hyprland.lua
local home = os.getenv("HOME")

-- === MONITORS ===
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
})

-- === AUTOSTART ===
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface button-layout ':'")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("sleep 1 && loginctl lock-session")
    hl.exec_cmd("uwsm app -- nm-applet")
    hl.exec_cmd("uwsm app -- waybar")
    hl.exec_cmd("uwsm app -- awww-daemon")
    hl.exec_cmd("uwsm app -- blueman-applet")
    hl.exec_cmd("uwsm app -- swaync")
    -- hl.exec_cmd("uwsm app -- hyprpolkitagent")
    hl.exec_cmd("uwsm app -- hypridle")
    hl.exec_cmd("uwsm app -- easyeffects --gapplication-service")
    hl.exec_cmd("matugen image ~/.config/hypr/current_wallpaper")
    hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
    hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")
end)

-- === ENVIRONMENT VARIABLES ===
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("HYPRSHOT_DIR", home .. "/Pictures/Screenshots")
-- hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
-- hl.env("XCURSOR_SIZE", "20")
-- hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
-- hl.env("HYPRCURSOR_SIZE", "20")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("GTK_THEME", "Adwaita:dark") 
hl.env("XDG_DATA_DIRS", home .. "/.local/share:/usr/local/share:/usr/share")

-- === GENERAL MODULES ===
require("configs.tags")
require("configs.looknfeel")
require("configs.UserAnimations")
require("configs.windowrules")

hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    render = {
        new_render_scheduling = true,
    },
})

require("configs.input")
require("configs.keybinds")
