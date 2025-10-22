require("fzf-lua").setup({
    winopts = {
        width = 0.90,
        height = 0.90,
        backdrop = 100,
        border = "none",
        preview = {
            border = "none",
            horizontal = "right:65%",
        },
    },
})

vim.keymap.set("n", "<leader>ff", "<CMD>:FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>:FzfLua live_grep<CR>")
