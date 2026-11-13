-- ~/.config/hypr/configs/input.lua

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle, grp:alt_shift_toggle",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,
        force_no_accel = false,

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- hl.gesture({
--     fingers = 3,
--     direction = "vertical",
--     action = "fullscreen",
-- })

hl.device({
    name = "ajazz-ajazz-nearlink-mouse",
    sensitivity = -0.2,
    accel_profile = "flat",
})

hl.device({
    name = "elan-touchpad",
    accel_profile = "adaptive",
    sensitivity = 0.25,
})

hl.device({
    name = "elan-trackpoint",
    accel_profile = "flat",
    sensitivity = 0.2,
})
