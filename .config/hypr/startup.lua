hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("mako")
end)

-- Old config doesnt work
-- exec-once = xremap --mouse ~/.config/xremap/config.yml
