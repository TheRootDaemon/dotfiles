require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "✗" },
        topdelete = { text = "^" },
        changedelete = { text = "✗" },
        untracked = { text = "?" },
    },

    signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "✗" },
        topdelete = { text = "^" },
        changedelete = { text = "✗" },
        untracked = { text = "?" },
    },
})

vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Navigate to the previous hunk" })
vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Navigate to the next hunk" })
vim.keymap.set("n", "gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
vim.keymap.set("n", "gph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview current hunk" })
