require("tokyonight").setup({
    style = "night",
    transparent = false,
    terminal_colors = true,

    on_colors = function(colors)
        colors.bg = "#191724"
        colors.bg_dark = "#191724"
        colors.bg_dark1 = "#191724"
        colors.fg_gutter = "#6e6a86"
    end,

    on_highlights = function(highlights, colors)
        highlights.LineNrAbove = { fg = colors.fg_gutter }
        highlights.LineNrBelow = { fg = colors.fg_gutter }
        highlights.EndOfBuffer = { fg = colors.fg_gutter, bold = true }
        highlights.TelescopeNormal = {
            bg = colors.bg_dark,
            fg = colors.fg_dark,
        }
        highlights.TelescopeBorder = {
            bg = colors.bg_dark,
            fg = colors.bg_dark,
        }
        highlights.TelescopePromptNormal = {
            bg = colors.bg_dark,
        }
        highlights.TelescopePromptBorder = {
            bg = colors.bg_dark,
            fg = colors.bg_dark,
        }
        highlights.TelescopePromptTitle = {
            bg = colors.bg_dark,
            fg = colors.bg_dark,
        }
        highlights.TelescopePreviewTitle = {
            bg = colors.bg_dark,
            fg = colors.bg_dark,
        }
        highlights.TelescopeResultsTitle = {
            bg = colors.bg_dark,
            fg = colors.bg_dark,
        }
    end
})

vim.cmd("colorscheme tokyonight")
vim.cmd(":hi statusline guibg=NONE")
