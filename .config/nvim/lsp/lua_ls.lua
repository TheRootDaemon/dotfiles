return {
	settings = {
		Lua = {
			codelens = { enable = true },
			completion = { callSnippet = false },
			diagnostics = { globals = { "vim" } },
			hint = { enable = true, semicolon = "Disable" },

			runtime = {
				version = "LuaJIT",
				path = { "?.lua", "?/init.lua", "lua/?.lua", "lua/?/init.lua" },
			},

			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
		},
	},
}
