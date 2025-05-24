return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                always_show_bufferline = false,
            },
        })
        vim.keymap.set("n", "<leader><Left>", ":bp<CR>")
        vim.keymap.set("n", "<leader><Right>", ":bn<CR>")
        vim.keymap.set("n", "<leader>w", ":bd<CR>")
    end,
}
