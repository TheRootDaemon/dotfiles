require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "gofumpt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        python = { "black", "isort" },
        svelte = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },
})
