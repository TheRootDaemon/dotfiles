require("trouble").setup({})

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics<CR>", { desc = "Show diagnostics in a buffer" })
