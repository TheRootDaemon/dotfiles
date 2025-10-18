vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	-- Dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/rafamadriz/friendly-snippets",
	-- Utils
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	-- LSP
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvim-mini/mini.indentscope",
	{
		src = "https://github.com/Saghen/blink.cmp",
		build = "cargo build --release",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "master",
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
