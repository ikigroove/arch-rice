-- ~/.config/hypr/configs/tags.lua

-- Мультимедиа (MPV, VLC)
hl.window_rule({
    match = { class = "(mpv|vlc)" },
    tag = "+multimedia_video",
})

-- Настройки сети, блютуз и архиватор
hl.window_rule({
    match = { class = "(nm-applet|nm-connection-editor|blueman-manager|org.gnome.FileRoller)" },
    tag = "+settings",
})
hl.window_rule({
    match = { class = "(org.gnome.DiskUtility|wihotspot(-gui)?)" },
    tag = "+settings",
})

-- Системные утилиты и просмотрщики
hl.window_rule({
    match = { class = "(org.gnome.SystemMonitor)" },
    tag = "+viewer",
})
hl.window_rule({
    match = { class = "(org.gnome.Evince)" },
    tag = "+viewer",
})
hl.window_rule({
    match = { class = "(eog|org.gnome.Loupe)" },
    tag = "+viewer",
})
