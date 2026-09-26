require("snacks").setup({
    indent = { enabled = true },
    notifier = { enabled = true },
})

-- sanity check, a simple LSP progress notification
vim.api.nvim_create_autocmd("LspProgress", {
    ---@param event {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(event)
        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
            id = "lsp_progress",
            title = "LSP Progress",
            opts = function(notification)
                notification.icon = event.data.params.value.kind == "end" and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})
