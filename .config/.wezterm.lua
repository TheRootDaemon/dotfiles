local wezterm = require("wezterm")
local config = wezterm.config_builder()

local catppuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
catppuccin.background = "191724"
config.color_schemes = { ["catppuccin"] = catppuccin }
config.color_scheme = "catppuccin"

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
    left = 4,
    right = 0,
    top = 4,
    bottom = 0,
}

config.font_size = 15
config.font = wezterm.font("FiraCode Nerd Font")
config.harfbuzz_features = { "calt = 0", "clig = 0", "liga = 0" }

return config
