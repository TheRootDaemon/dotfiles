return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("tokyonight").setup({
            style = "moon",
            transparent = false,
            terminal_colors = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            on_highlights = function(highlights, colors)
                local colorBuffer = colors.fg_dark
                highlights.LineNr = { fg = colorBuffer }
                highlights.LineNrAbove = { fg = colorBuffer }
                highlights.LineNrBelow = { fg = colorBuffer }
                highlights.EndOfBuffer = { fg = colorBuffer, bold = true }
            end,
        })
        vim.cmd.colorscheme("tokyonight")
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
