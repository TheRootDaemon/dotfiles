return {
    "nvimtools/none-ls.nvim",
    event = "LspAttach",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Formatting for Lua files
                null_ls.builtins.formatting.stylua,

                -- Formatting for Python files
                null_ls.builtins.formatting.black,

                -- Sorting and organizing Python import statements
                null_ls.builtins.formatting.isort,

                -- Formatting for JavaScript, TypeScript, JSON, CSS, HTML, etc.
                -- null_ls.builtins.formatting.prettier,

                -- Formatting and organizing imports for Go files
                null_ls.builtins.formatting.goimports,

                -- Formatting for C/C++ files
                null_ls.builtins.formatting.clang_format,
            },
        })
    end,
}
