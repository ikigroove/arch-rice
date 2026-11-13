-- ~/.config/hypr/configs/windowrules.lua

-- === APPLICATIONS BLUR & OPACITY + FLOAT & SIZE ===
hl.window_rule({
    match = { tag = "multimedia_video" },
    no_blur = true,
    opacity = "1.0",
    float = true,
    size = { 900, 506 },
})

hl.window_rule({
    match = { tag = "settings" },
    opacity = "0.9",
    float = true,
})

hl.window_rule({
    match = { tag = "viewer" },
    float = true,
})

hl.window_rule({
    match = { class = "org.gnome.Nautilus" },
    opacity = "0.9",
})

hl.window_rule({
    match = { class = "(gedit|org.gnome.TextEditor|mousepad)" },
    opacity = "0.9",
})

hl.window_rule({
    match = { class = "org.pulseaudio.pavucontrol" },
    opacity = "0.9",
    float = true,
    size = "50% 60%",
})

hl.window_rule({
    match = { class = "kitty" },
    opacity = "0.9",
})

-- hl.window_rule({
--     match = { class = "(discord|vesktop|org.telegram.desktop)" },
--     opacity = "0.85 0.7",
-- })

hl.window_rule({
    match = { class = "Spotify" },
    opacity = "0.8 0.6",
})

-- === LAYER RULES ===
hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    match = { namespace = "logout_dialog" },
    blur = true,
})

-- === SWAYNC BLUR & XRAY ===
hl.layer_rule({
    match = { namespace = "swaync-control-center" },
    blur = true,
    ignore_alpha = 0.5,
    xray = false,
})

hl.layer_rule({
    match = { namespace = "swaync-notification-window" },
    blur = true,
    ignore_alpha = 0.5,
    xray = false,
})

-- === SUPPRESS MAXIMIZE & XWAYLAND FIX ===
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- === DIALOGUES ===
hl.window_rule({
    match = { title = "(Save As|Save a File|Pick Files)" },
    float = true,
    size = "50% 60%",
    center = true,
})

hl.window_rule({
    match = { initial_title = "(Open Files)" },
    float = true,
    size = "70% 60%",
})

-- === Chrome PiP ===
hl.window_rule({
    match = { title = "^(Picture in picture)$" },
    float = true,
    pin = true,
    size = "25% 25%",
    move = "72% 72%",
    opacity = "1.0",
})
