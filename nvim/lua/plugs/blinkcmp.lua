require("blink.cmp").setup({
    completion = {
        documentation = {
            auto_show = true,
        },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})
