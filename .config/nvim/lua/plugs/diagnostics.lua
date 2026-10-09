--- Show diagnostics in the quickfix or in the location list.
---@param scope "buffer" | "workspace" The range of diagnostics to display.
--- - "buffer": Diagnostics in the current buffer.
--- - "workspace": Diagnostics across all buffers.
local function show_diagnostics(scope)
    ---@type vim.Diagnostic[]
    local diagnostics
    local is_workspace = scope == "workspace"

    if is_workspace then
        diagnostics = vim.diagnostic.get()
    else
        diagnostics = vim.diagnostic.get(0)
    end

    if #diagnostics == 0 then
        local target = is_workspace and "workspace" or "current buffer"
        vim.notify("No diagnostics in the " .. target, vim.log.levels.INFO)
        return
    end

    ---@type fun(opts?: vim.diagnostic.setqflist.Opts)
    local set_list
    if is_workspace then
        set_list = vim.diagnostic.setqflist
    else
        set_list = vim.diagnostic.setloclist
    end
    set_list({ open = true })
end

require("tiny-inline-diagnostic").setup({
    preset = "classic",
    hi = { background = "Normal" },
})

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
    vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
    vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "<leader>db", function()
    show_diagnostics("buffer")
end, { desc = "Buffer Diagnostics (Location List)" })

vim.keymap.set("n", "<leader>dd", function()
    show_diagnostics("workspace")
end, { desc = "All Diagnostics (Quickfix)" })
