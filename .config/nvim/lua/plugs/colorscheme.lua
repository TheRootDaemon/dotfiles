require("rose-pine").setup({})

vim.cmd.colorscheme("rose-pine")

vim.api.nvim_set_hl(0, "StatusLine", {
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "StatusLineNC", {
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "TreesitterContextBottom", {
    underline = true,
    sp = "#9ccfd8",
})

vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", {
    underline = true,
    sp = "#9ccfd8",
})
