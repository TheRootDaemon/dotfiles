return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			flavour = "mocha",
			custom_highlights = function(colors)
				return {
					LineNr = { fg = colors.flamingo },
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
