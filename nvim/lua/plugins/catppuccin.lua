return {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    LineNr = { fg = colors.text },
                    EndOfBuffer = { fg = colors.text },
                }
            end,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
