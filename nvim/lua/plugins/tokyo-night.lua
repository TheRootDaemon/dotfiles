return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = "transparent",
                floats = "transparent",
            },
            sidebars = { "qf", "help" },
            day_brightness = 0.3,
            hide_inactive_statusline = false,
            dim_inactive = false,
            lualine_bold = false,
            on_highlights = function(highlights, colors)
                local shiro = colors.fg

                highlights.LineNr = { fg = shiro }
                highlights.LineNrAbove = { fg = shiro }
                highlights.LineNrBelow = { fg = shiro }

                highlights.EndOfBuffer = { fg = shiro, bold = true }
            end,
        })

        vim.cmd.colorscheme("tokyonight")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
