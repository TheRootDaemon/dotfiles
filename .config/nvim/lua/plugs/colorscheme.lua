require("rose-pine").setup({
    palette = {
        main = {
            base = "#191724",
            surface = "#191724",
            overlay = "#191724",
        },
    },
})
vim.cmd("colorscheme rose-pine")
vim.cmd(":hi statusline guibg=NONE")
