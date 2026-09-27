local min_contrast = 3

local function linear(channel)
    local c = tonumber(channel, 16) / 255
    if c <= 0.03928 then
        return c / 12.92
    end

    return ((c + 0.055) / 1.055) ^ 2.4
end

local function hex(color)
    if type(color) == "string" then
        return color:match("^#%x%x%x%x%x%x$")
    end
end

local function luminance(color)
    local r, g, b = color:match("^#(%x%x)(%x%x)(%x%x)$")
    return 0.2126 * linear(r) + 0.7152 * linear(g) + 0.0722 * linear(b)
end

local function contrast(a, b)
    a, b = hex(a), hex(b)
    if not (a and b) then
        return 0
    end

    local high, low = luminance(a), luminance(b)
    if high < low then
        high, low = low, high
    end
    return (high + 0.05) / (low + 0.05)
end

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

                        if editor_bg and contrast(section.bg, editor_bg) >= min_contrast then
                            fg = section.bg
                        end

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
        lualine_b = { "branch", "filename" },
        lualine_c = { "diagnostics" },

        lualine_x = { "diff" },
        lualine_y = { "filetype" },
        lualine_z = { "location", "progress" },
    },
})
