local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
    left = 4,
    right = 0,
    top = 4,
    bottom = 0,
}

config.font_size = 13
config.color_scheme = "Tokyo Night"
config.harfbuzz_features = { "calt = 0", "clig = 0", "liga = 0" }

return config
