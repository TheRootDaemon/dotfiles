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
                "jdtls",
            },
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local function setup_keymaps(bufnr)
            local opts = { buffer = bufnr }
            local map = vim.keymap.set
            map("n", "K", vim.lsp.buf.hover, opts)
            map("n", "gd", vim.lsp.buf.definition, opts)
            map("n", "gD", vim.lsp.buf.declaration, opts)
            map("n", "gi", vim.lsp.buf.implementation, opts)
            map("n", "go", vim.lsp.buf.type_definition, opts)
            map("n", "gr", vim.lsp.buf.references, opts)
            map("n", "gs", vim.lsp.buf.signature_help, opts)
            map("n", "gl", vim.diagnostic.open_float, opts)
            map("n", "<F2>", vim.lsp.buf.rename, opts)
            map({ "n", "x" }, "<F3>", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
            map("n", "<F4>", vim.lsp.buf.code_action, opts)
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                setup_keymaps(event.buf)

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and vim.tbl_contains({ "lua", "python", "json" }, vim.bo.filetype) then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = event.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = event.buf,
                                id = client.id,
                                formatting_options = { tabSize = 4, insertSpaces = true },
                            })
                        end,
                    })
                end
            end,
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
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = { library = { vim.env.VIMRUNTIME } },
                        },
                    },
                })
            end,

            _default = function(server_name)
                lspconfig[server_name].setup({ capabilities = capabilities })
            end,
        }

        for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
            (servers[server] or servers._default)(server)
        end
    end,
}
