-- load snippets from friendly snippets through luasnip
require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
    snippets = { preset = "luasnip" },

    completion = { documentation = { auto_show = true } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})
