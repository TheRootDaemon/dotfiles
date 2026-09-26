require("fzf-lua").setup({
    winopts = {
        backdrop = 0,
        fullscreen = true,
        preview = { horizontal = "right:65%" },
    },
})

vim.keymap.set("n", "<leader>ff", "<CMD>:FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>:FzfLua live_grep<CR>")
