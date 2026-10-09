require("trouble").setup({})

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Show diagnostics in a buffer" })
