require("tiny-inline-diagnostic").setup({
    preset = "classic",
    hi = {
        background = "Normal",
    },
})

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
    vim.diagnostic.open_float(nil, { focus = false })
end)

vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
    vim.diagnostic.open_float(nil, { focus = false })
end)
