return {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("dracula").setup({
            show_end_of_buffer = true,
            transparent_bg = true,
            overrides = function(colors)
                return {
                    LineNr = { fg = colors.comment },
                    EndOfBuffer = { fg = colors.comment, bold = true },
                }
            end,
        })
        vim.cmd.colorscheme("dracula")
    end
}
