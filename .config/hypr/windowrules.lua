-- global gaps
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 1,
    },
})

-- Blur disabled by default
local blurred_windows = ".*ghostty*"
hl.window_rule({
    name  = "no-blur-default",
    match = { class = "negative:" .. blurred_windows },
    no_blur = true,
})

-- opacity windows
hl.window_rule({
    match = { class = ".*alacritty*" },
    opacity = "0.8 0.5",
})
hl.window_rule({
    match = { class = ".*ghostty*" },
    opacity = "0.8 0.5",
})
hl.window_rule({
    match = { title = "nvim.*" },
    opacity = "1.0 1.0",
})
-- hl.window_rule({ match = { class = ".*discord*" }, opacity = "0.95 0.5" })

-- special
hl.window_rule({
    name  = "discord-special",
    match = { class = "discord" },
    workspace = "silent special:" .. s_1,
})
hl.window_rule({
    name  = "term-special",
    match = { class = term },
    workspace = "silent special:terminal",
})
hl.window_rule({
    name  = "termfilechooser-float",
    match = { title = "termfilechooser" },
    float = true,
    size = { 1200, 800 },
})
hl.window_rule({
    name  = "yazi-float",
    match = { title = "^Yazi.*" },
    float = true,
    size = { 1200, 800 },
})
hl.window_rule({
    name  = "power-opt-float",
    match = { title = "Power Options" },
    float = true,
})
hl.window_rule({
    name  = "btop-float",
    match = { title = "btop" },
    float = true,
    size = { 1300, 900 },
})

-- Waydroid
hl.window_rule({
    name  = "waydroid-workspace",
    match = { class = "Waydroid" },
    workspace = "4 silent",
})

-- Example layerrule (adjust as needed based on your specific setup)
-- hl.layer_rule({ match = { namespace = "menus" }, unset = true })
-- hl.layer_rule({ match = { namespace = "popups" }, unset = true })
