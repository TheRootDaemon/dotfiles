local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Color scheme
config.color_scheme = "Rosé Pine (Gogh)"

-- Font configs
config.font_size = 19
config.font = wezterm.font("Maple Mono NF")
config.allow_square_glyphs_to_overflow_width = "Never"
config.harfbuzz_features = {
    "cv01", -- removes gaps for symbols like ~@#$%&
    "cv65", -- alternative &
    "ss01", -- breaks equals
    "ss04", -- breaks multi underscore
    "ss05", -- removes thin backslashes
    "ss07", -- relaxes multiple greaters
}

-- Cursor configs
config.cursor_blink_rate = 0
config.hide_mouse_cursor_when_typing = true

-- Window rules
config.enable_wayland = false
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_padding = {
    left = 0,
    right = 0,
    top = 10,
    bottom = 0,
}

return config
