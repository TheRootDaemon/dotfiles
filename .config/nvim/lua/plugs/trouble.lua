require("trouble").setup()

vim.keymap.set("n", "<leader>t", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>")
