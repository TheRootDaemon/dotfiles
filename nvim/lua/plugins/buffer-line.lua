return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufWinEnter",
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                indicator = {
                }
            }
        })

        vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", {})
        vim.keymap.set("n", "<leader>n", "<cmd>BufferLineCycleNext<CR>", {})
        vim.keymap.set("n", "<leader>p", "<cmd>BufferLineCyclePrev<CR>", {})
    end,
}
