local which_key = require("which-key")

which_key.setup({
    delay = 2000,
    preset = "helix",
})

vim.keymap.set("n", "<leader>?", function()
    which_key.show({ global = false })
end, { desc = "Show which key comes next" })
