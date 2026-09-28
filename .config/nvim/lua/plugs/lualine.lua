--- Convert an 8-bit sRGB color channel to linear RGB.
---
--- The input channel is normalized to the range of `0` to `1`
--- then converted from sRGB to linear RGB
--- using the appropriate transfer function.
---
---@param channel string The two-digit hexadecimal color component in the range of `00` to `ff`.
---@return number The linear RGB value in the range of `0` to `1`.
local function linear(channel)
    local c = tonumber(channel, 16) / 255
    if c <= 0.03928 then
        return c / 12.92
    end

    return ((c + 0.055) / 1.055) ^ 2.4
end

--- Validate and return a hexadecimal color string.
---
---@param color string The color value to validate.
---@return string|nil The color if it is a valid 6-digit hexadecimal color, nil otherwise.
local function hex(color)
    if type(color) == "string" then
        return color:match("^#%x%x%x%x%x%x$")
    end
end

--- Calculate the relative luminance of an sRGB color.
---
--- Extracts the red, green and blue channels
--- converts each channel from sRGB to linear RGB,
--- combines them using standard luminance coefficients.
---
---@param color string A 6-digit hexadecimal color, e.g. `#000000`.
---@return number The relative luminance of the color, ranging from `0` (black) to `1` (white).
local function luminance(color)
    local r, g, b = color:match("^#(%x%x)(%x%x)(%x%x)$")
    return 0.2126 * linear(r) + 0.7152 * linear(g) + 0.0722 * linear(b)
end

--- Calculate the contrast ratio between two sRGB colors.
---
--- Converts both colors to relative luminance
--- and calculates their contrast ratio
--- using the WCAG contrast formula.
---
--- The lighter color is always placed first in the calculation
--- ensuring the returned ratio is always at least `1`.
---
---@param a string A 6-digit hexadecimal color, e.g. `#000000`.
---@param b string A 6-digit hexadecimal color, e.g. `#ffffff`.
---@return integer The contrast ratio between the two colors, ranging from `1` to `21`.
local function contrast(a, b)
    local color_a, color_b = hex(a), hex(b)
    if not (color_a and color_b) then
        return 0
    end

    local high, low = luminance(color_a), luminance(color_b)
    if high < low then
        high, low = low, high
    end

    return (high + 0.05) / (low + 0.05)
end

--- Minimum contrast required against the editor's background.
---
--- Colors below this ratio are considered insufficiently contrasted
--- and are replaced with a color that provides sufficient contrast.
local min_contrast = 3

require("lualine").setup({
    options = {
        globalStatus = 3,
        icons_enabled = true,
        theme = function()
            local theme = require("lualine.utils.loader").load_theme("auto")
            local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
            local editor_bg = hex("#" .. ("%06x"):format(normal.bg) or nil)
            local editor_fg = normal.fg and ("%06x"):format(normal.fg) or nil

            for _, sections in pairs(theme) do
                for _, section in pairs(sections) do
                    if type(section) == "table" and type(section.bg) == "string" then
                        local fg = section.fg

                        -- if the section's background has enough contrast against the editor,
                        -- use that as the section's foreground, since the background will be removed
                        if editor_bg and contrast(section.bg, editor_bg) >= min_contrast then
                            fg = section.bg
                        end

                        -- if the current foreground does not have enough contrast,
                        -- fall back to the editor's foreground
                        if editor_bg and hex(fg) and contrast(fg, editor_bg) < min_contrast then
                            fg = editor_fg
                        end

                        section.fg = fg
                        section.bg = "NONE"
                    end
                end
            end

            return theme
        end,

        component_separators = {},
        section_separators = {},
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", { "branch", icon = "" } },
        lualine_c = { "diagnostics" },

        lualine_x = { "diff" },
        lualine_y = { "filetype" },
        lualine_z = { "location", "progress" },
    },
})
