--      KEYBINDS
local mainMod = "SUPER"
local HOME = os.getenv("HOME")

--      Hyprland Keybinds

hl.bind("F13", hl.dsp.pass({ window = "class:^(vesktop)$" }), { description = "Push to talk in Vesktop" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file_man), { description = "Open file manager" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind(mainMod .. " + SHIFT + W", function()
    local res = hl.dispatch(hl.dsp.exec_cmd("killall waybar"))
    hl.timer(function ()
        hl.exec_cmd("waybar")
        hl.notification.create({ text = "Waybar reloaded", icon = "ok", timeout = 5000})
    end,  { timeout = 500, type = "oneshot" })
end, { description = "Reload Waybar"})

-- Toggle floating
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })

-- Focus windows
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }), { description = "Focus down" })

-- Move windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }), { description = "Move window left" })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }), { description = "Move window right" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }), { description = "Move window up" })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }), { description = "Move window down" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen(), { description = "Fullscreen" })

--      RESIZING WINDOWS

-- Small step resize (holdable)
hl.bind(mainMod .. " + Right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + Left",  hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + Down",  hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + Up",    hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

-- Larger steps with Shift
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Down",  hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Up",    hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })

--      Workspace switching

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(s_1), { description = "Toggle special workspace" })
-- hl.bind(mainMod .. " + RETURN", hl.dsp.workspace.toggle_special("terminal"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(HOME .. "/.config/hypr/scripts/open_terminal.sh"), { description = "Open terminal" })

-- Move window to workspace
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:" .. s_1 }))

--       Screenshot

-- Full
hl.bind("Print", hl.dsp.exec_cmd("grim ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"), { description = "Screenshot full" })
-- Area selection
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"), { description = "Screenshot area" })
-- Area screenshot + editor
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"), { description = "Screenshot area + editor" })
-- Clipboard
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("wl-copy < /tmp/lastshot.png"), { description = "Copy last screenshot" })

--           System

-- Reload config
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload Hyprland config" })

-- Volume (requires wireplumber/pipewire-pulse)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))

-- Power Options
local power_cmd = "kitty --title='Power Options' -e " .. HOME .. "/.config/hypr/scripts/power_opt"
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd(power_cmd), { description = "Shutdown" })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("hyprlock"))

--           MISC
-- app launcher
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("fuzzel"), { description = "App launcher" })
-- discord PTT
hl.bind("F24", hl.dsp.pass({ window = "class:^(discord)$" }), { description = "Discord push to talk" })
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(term .. " --title=btop --command=btop"), { description = "Open btop" })
