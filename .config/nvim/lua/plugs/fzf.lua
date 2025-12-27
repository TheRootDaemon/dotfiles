require("fzf-lua").setup({
    winopts = {
        backdrop = 0,
        border = "none",
        fullscreen = true,
        preview = {
            border = "none",
            horizontal = "right:65%",
        },
    },
})

vim.keymap.set("n", "<leader>ff", "<CMD>:FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>:FzfLua live_grep<CR>")
