return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "catppuccin/nvim" },
		enabled = true,
		init = false,
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"⠀⠀⠀⠀⣠⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣄⠀⠀⠀⠀",
				"⠀⠀⠀⠸⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣇⠀⠀⠀",
				"⢀⣤⣤⣼⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣤⣤⡀",
				"⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⢀⣴⡞⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣦⡀⠀⠀⠀⠀⢀⣴⣶⣿⣿⣿⣿⣿⣿⣿",
				"⠙⠿⣿⡿⠏⢿⣿⣿⣿⣿⣦⣀⠀⣴⣿⠟⣤⡿⢁⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⡈⢿⣤⡙⣿⣦⡀⢀⣰⣿⣿⣿⣿⡿⠙⢿⣿⠿⠋",
				"⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⠃⠺⠛⠟⠻⠛⠓⠛⠛⠛⠛⠛⠛⠛⠛⠛⠟⠛⠟⠆⠟⠛⠚⠟⠳⠘⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⡏⠀⡀⠂⠌⠀⠌⠠⠁⠌⠠⠁⠌⠠⠁⠌⠐⡀⠡⠀⠂⠈⠐⠀⢂⠐⠀⢸⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣁⣐⣈⣀⣀⣐⣀⣀⣂⣐⣀⣈⣀⣂⣀⣐⣀⣂⣁⣀⣁⣂⣀⣁⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠻⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⡿⠋⠉⠛⠻⣿⣿⣿⣿⣿⣿⠟⠉⠉⠛⠿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⠁⠀⠀⠀⠀⠀⠹⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⡇⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠀⠀⠀⠀⠀⠀⢠⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢻⣿⣦⣀⣀⣀⣠⣴⣿⡿⠿⣿⣷⣄⣀⣀⣀⣤⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣇⠀⠀⣨⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⢰⣶⣬⣍⢙⣛⠛⠙⠋⠙⣉⡉⣭⣴⣾⡄⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡇⣍⡛⠿⠏⣷⣿⣿⣿⢸⣿⣿⣧⢿⠿⠟⣁⢻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⡇⠾⣿⣷⣆⣤⣭⣭⣍⢨⣭⣭⣥⠐⣶⣿⡟⢸⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⢠⣴⣾⣿⣦⣼⣿⣿⣿⣿⠟⠃⣷⣬⣙⡛⠻⠿⣿⣿⢸⣿⡿⠿⢘⣋⣥⣶⠘⠻⣿⣿⣿⣿⣷⣴⣾⣿⣶⡄⠀⠀⠀⠀",
				"⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢻⣿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣾⣿⣿⣿⡏⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠙⠛⢻⣿⣿⣿⣿⡆⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⢠⣿⣿⣿⣿⡟⠛⠋⠁⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠈⠿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀",
			}

			dashboard.section.buttons.val = {
				dashboard.button("1", "  New File", ":ene <BAR> startinsert <CR>"),
				dashboard.button("2", "󰒲  Lazy", ":Lazy<CR>"),
				dashboard.button("3", "  Lazy Update", ":Lazy update<CR>"),
				dashboard.button("4", "  Lazy Sync", ":Lazy sync<CR>"),
				dashboard.button("5", "  Quit", ":qa<CR>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end

			local catppuccin = require("catppuccin.palettes").get_palette()

			vim.api.nvim_set_hl(0, "AlphaHeader", { fg = catppuccin.pink, bold = true })
			vim.api.nvim_set_hl(0, "AlphaButtons", { fg = catppuccin.blue })
			vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = catppuccin.teal })
			vim.api.nvim_set_hl(0, "AlphaFooter", { fg = catppuccin.maroon, italic = true })

			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "AlphaFooter"
			dashboard.opts.layout[1].val = 3
			return dashboard
		end,
		config = function(_, dashboard)
			vim.keymap.set("n", "<leader>h", ":Alpha<CR>")
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					once = true,
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "LazyVimStarted",
				callback = function()
					dashboard.section.footer.val = {
						"  As long as I Live, There are Infinite Chances !",
						"                         ~ Monkey D. Luffy",
					}
					if vim.api.nvim_buf_is_valid(0) then
						pcall(vim.cmd.AlphaRedraw)
					end
				end,
			})
		end,
	},
}
