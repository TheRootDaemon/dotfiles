require("oil").setup({
    default_file_explorer = true,
    view_options = { show_hidden = true },
})

vim.keymap.set("n", "-", "<CMD>:Oil<CR>", { desc = "Explore files (oil)" })
