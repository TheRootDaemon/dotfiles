vim.keymap.set("n", "<leader>a", function()
    require("buffer_manager.ui").toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>x", "<CMD>:bdelete<CR>")

vim.keymap.set("n", "<leader>n", "<CMD>:bnext<CR>")
vim.keymap.set("n", "<leader>b", "<CMD>:bprevious<CR>")
