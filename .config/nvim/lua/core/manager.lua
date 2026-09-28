vim.pack.add({
    -- colorscheme
    "https://github.com/rose-pine/neovim",

    -- completion(s) and autosuggestions
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },

    -- LSP
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
    "https://github.com/folke/trouble.nvim",
    "https://github.com/stevearc/conform.nvim",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

    -- ui
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/folke/which-key.nvim",

    -- utilities
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/stevearc/oil.nvim",
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

    -- transitive dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

local plugs = vim.fn.stdpath("config") .. "/lua/plugs"
if vim.fn.isdirectory(plugs) == 1 then
    for _, file in ipairs(vim.fn.readdir(plugs)) do
        if file:match("%.lua$") then
            local plug = file:match("^(.*)%.lua$")
            local status, error = pcall(require, "plugs." .. plug)
            if not status then
                vim.notify("Failed to load " .. plug .. ": " .. error, vim.log.levels.ERROR)
            end
        end
    end
end
