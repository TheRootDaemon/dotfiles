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
                "tailwindcss",
            },
        })

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
                    [vim.diagnostic.severity.ERROR] = "󰅚",
                    [vim.diagnostic.severity.WARN] = "󰀪",
                    [vim.diagnostic.severity.HINT] = "󰌶",
                    [vim.diagnostic.severity.INFO] = "󰋽",
                },
            },
        })

        require("lspconfig.ui.windows").default_options.border = "rounded"

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
            vim.keymap.set("n", "ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
        end

        -- Server configurations
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = { vim.env.VIMRUNTIME } },
                    },
                },
            },
            cssls = {
                filetypes = { "css", "scss", "svelte", "less" },
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    scss = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                    less = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                },
            },
            svelte = {
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
            },
        }

        -- Setup servers installed by mason-lspconfig
        for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
            local server_config = servers[server_name] or {}

            -- Merge default config with server-specific config
            local config = vim.tbl_deep_extend("force", {
                capabilities = capabilities,
                on_attach = on_attach,
            }, server_config)

            lspconfig[server_name].setup(config)
        end
    end,
}
