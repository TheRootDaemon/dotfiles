vim.lsp.enable({
    "clangd",
    "bashls",
    "buf_ls",
    "lua_ls",
    "gopls",
    "zls",
    "nixd",
    "html",
    "cssls",
    "ts_ls",
    "svelte",
    "tailwindcss",
    "pyright",
    "yamlls",
    "jsonls",
})

-- builds the capabilities of the LSP servers,
-- starts with the neovim's default
-- and extends it through blink.cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

-- enables code folding
capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
})

-- enables builtin LSP completions
-- when attached to the appropriate LSP servers
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(env)
        local client = vim.lsp.get_client_by_id(env.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, env.buf, { autotrigger = true })
        end
    end,
})

-- diagnostics are minimal, since it is extended by a plugin
vim.diagnostic.config({
    signs = true,
    severity_sort = true,
    virtual_text = false,
})

-- controls auto formatting on save
local format_on_save = true

-- toggles format_on_save
vim.keymap.set("n", "<leader>tf", function()
    format_on_save = not format_on_save
    vim.notify("Format on save " .. (format_on_save and "enabled" or "disabled"))
end)

-- autocommand to format the buffer before saving
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
    callback = function()
        if format_on_save then
            vim.lsp.buf.format({ async = false })
        end
    end,
})
