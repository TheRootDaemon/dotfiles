return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        preview_width = 0.6,
                        width = 0.7,
                        height = 0.9,
                    },
                },
            })
            vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
            vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
