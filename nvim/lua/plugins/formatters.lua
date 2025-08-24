return {
    "stevearc/conform.nvim",
    event = "LspAttach",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black", "isort" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
                sh = { "shfmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                html = { "prettier" },
                css = { "prettier" },
                yaml = { "prettier" },
                svelte = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })
    end,
}
