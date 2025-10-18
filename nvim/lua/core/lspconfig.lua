vim.lsp.enable({
    "bashls",
    "lua_ls",
    "gopls",
    "ts_ls",
    "svelte",
    "tailwindcss",
    "pyright",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(env)
        local client = vim.lsp.get_client_by_id(env.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, env.buf, { autotrigger = true })
        end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = "minimal",
    },
    signs = true,
})
