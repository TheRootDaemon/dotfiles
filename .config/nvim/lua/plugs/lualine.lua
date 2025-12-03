local daemon = require("core.helpers")

require("lualine").setup({
    options = {
        theme = "rose-pine",
        component_separators = "",
        section_separators = { right = "", left = "" },
        icons_enabled = false,
    },
    sections = {
        lualine_a = { { "mode", separator = { right = "" } } },
        lualine_b = { { "filename", path = 1, cond = daemon.isBufEmpty } },
        lualine_c = {
            {
                "diagnostics",
                symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
            },
        },
        lualine_x = {
            {
                "buffers",
                hide_filename_extension = true,
                symbols = {
                    alternate_file = "",
                    directory = "",
                },
                fmt = function(name, context)
                    local index = daemon.getBufIndex(context.bufnr)
                    return string.format("%d:%s", index, name)
                end,
                cond = daemon.isBufEmpty,
            },
        },
        lualine_y = {},
        lualine_z = {
            { "location", separator = { left = "" } },
        },
    },
    inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
})
