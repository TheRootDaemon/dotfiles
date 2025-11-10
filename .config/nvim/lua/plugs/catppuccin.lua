require("catppuccin").setup({
    float = {
        transparent = true,
        solid = false,
    },
    show_end_of_buffer = true,
    term_colors = true,
    color_overrides = {
        mocha = {
            base = "#191724",
            mantle = "#191724",
            crust = "#191724",
        },
    },
})

vim.cmd("colorscheme catppuccin-mocha")
vim.cmd(":hi statusline guibg=NONE")
