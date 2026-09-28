--- Controls auto formatting on save.
local format_on_save = true

-- toggles format_on_save
vim.keymap.set("n", "<leader>tf", function()
    format_on_save = not format_on_save
    vim.notify("Format on save " .. (format_on_save and "enabled" or "disabled"))
end, { desc = "Toggle auto formatting for current buffer" })

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
    formatters = {
        stylua = {
            prepend_args = {
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
                "--column-width",
                "120",
            },
        },
    },
    format_on_save = function()
        if not format_on_save then
            return
        end

        return {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        }
    end,
})
