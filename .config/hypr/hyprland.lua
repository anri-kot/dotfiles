-- modules
require("defaults")
require("binds")
require("windowrules")
require("startup")

hl.monitor({
    output = "",
    mode = "1920x1080",
    position = "auto",
    scale = 1,
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
    input = {
        kb_layout = "br",
        kb_variant = "abnt2",
        follow_mouse = 1,
        numlock_by_default = true,
        kb_options = "fkeys:basic_13-24",
    },
})

-- LAUNCHER
-- hl.window_rule({ match = { class = "^(Alacritty)$", title = "^(launch)$" }, float = true })
-- hl.window_rule({ match = { class = "^(Alacritty)$", title = "^(launch)$" }, size = "600 400" })
-- hl.window_rule({ match = { class = "^(Alacritty)$", title = "^(launch)$" }, center = true })
