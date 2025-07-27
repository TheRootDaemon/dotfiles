return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				ensure_installed = {
					"svelte",
					"python",
					"html",
					"css",
					"yaml",
					"json",
					"lua",
					"go",
					"c",
					"bash",
					"javascript",
					"typescript",
					"scss",
				},
				auto_install = true,
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				indent = { enable = true },
			})
		end,
	},
}
