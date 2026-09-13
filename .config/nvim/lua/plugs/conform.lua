require("conform").setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		go = { "gofumpt" },
		lua = { "stylua" },
		nix = { "alejandra" },
		proto = { "buf" },
		python = { "black", "isort" },
		sh = { "shfmt" },
		zig = { "zigfmt" },

		-- markup
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		markdown = { "prettier" },
		svelte = { "prettier" },
		typescript = { "prettier" },
		yaml = { "prettier" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})
