vim.pack.add({
    "https://github.com/catppuccin/nvim",

    -- Dependencies
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/rafamadriz/friendly-snippets",

    -- Utilities
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/akinsho/bufferline.nvim",

    -- LSPs
    "https://github.com/neovim/nvim-lspconfig",
    {
        src = "https://github.com/Saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },

    -- Formatters
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/nvim-mini/mini.indentscope",
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
})

local plugs = vim.fn.stdpath("config") .. "/lua/plugs"
if vim.fn.isdirectory(plugs) == 1 then
    for _, file in ipairs(vim.fn.readdir(plugs)) do
        if file:match("%.lua$") then
            local plug = file:match("^(.*)%.lua$")
            local status, error = pcall(require, "plugs." .. plug)
            if not status then
                vim.notify("Failed to load " .. plug .. ": " .. error)
            end
        end
    end
end
