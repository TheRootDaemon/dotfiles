return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"bashls",
				"gopls",
				"clangd",
				"svelte",
			},
		})

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_nvim_lsp.default_capabilities()
		)

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
			desc = "Format buffer before saving",
		})

		vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
			local augroup = vim.api.nvim_get_autogroups({ name = "LspFormatOnSave" })
			if next(augroup) then
				vim.api.nvim_del_augroup_by_name("LspFormatOnSave")
				print("Format on save disabled")
			else
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
					desc = "Format buffer before saving",
				})
				print("Format on save enabled")
			end
		end, { desc = "Toggle format on save" })

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, silent = true, noremap = true }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				vim.tbl_extend("force", opts, { desc = "Go to Definition" })
			)
			vim.keymap.set(
				"n",
				"gr",
				vim.lsp.buf.references,
				vim.tbl_extend("force", opts, { desc = "Go to References" })
			)
			vim.keymap.set(
				"n",
				"<leader>ca",
				vim.lsp.buf.code_action,
				vim.tbl_extend("force", opts, { desc = "Code Action" })
			)
		end

		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			float = {
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
		})

		local servers = {
			lua_ls = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = { vim.env.VIMRUNTIME } },
						},
					},
				})
			end,

			svelte = function()
				lspconfig.svelte.setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						on_attach(client, bufnr)
						if client.name == "svelte" then
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts", "*.svelte" },
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
								end,
							})
						end
					end,
				})
			end,

			_default = function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		}

		for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
			(servers[server] or servers._default)(server)
		end
	end,
}
