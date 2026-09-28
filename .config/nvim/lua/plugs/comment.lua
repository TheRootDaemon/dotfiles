local Comment = require("Comment")
Comment.setup({ mappings = false })

local api = require("Comment.api")
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

vim.keymap.set("n", "<leader>gc", api.call("toggle.linewise.current", "g@$"), {
    expr = true,
    desc = "Comment toggle linewise",
})

vim.keymap.set("n", "<leader>gb", api.call("toggle.blockwise.current", "g@$"), {
    expr = true,
    desc = "Comment toggle blockwise",
})

vim.keymap.set("x", "gc", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.linewise(vim.fn.visualmode())
end, { desc = "Comment toggle linewise" })

vim.keymap.set("x", "gb", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.blockwise(vim.fn.visualmode())
end, { desc = "Comment toggle blockwise" })
