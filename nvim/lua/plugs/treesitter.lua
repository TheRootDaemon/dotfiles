require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("RunTSUpdate", { clear = true }),
	callback = function(event)
		if event.data.kind == "update" then
			vim.schedule(function()
				pcall(function()
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")
					print("Updating treesitter")

					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")
					vim.notify("Updating treesitter")

					vim.cmd("TSUpdate")

					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")
					print("Finished :) treesitter")

					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
					vim.notify("Finished :) treesitter")
				end)
			end)
		end
	end,
})
