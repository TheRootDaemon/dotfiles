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
