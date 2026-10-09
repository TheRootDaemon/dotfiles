local snacks = require("snacks")

snacks.setup({
    animate = { enabled = true },
    bigfile = { enabled = true },
    indent = { enabled = true },
    picker = {
        enabled = true,
        exclude = {
            "**/.git/*",
            "**/node_modules/*",
            "**/.yarn/cache/*",
            "**/.yarn/install*",
            "**/.yarn/releases/*",
            "**/.pnpm-store/*",
            "**/.idea/*",
            "**/.DS_Store",
            "**/.venv/**",
            "build/*",
            "coverage/*",
            "dist/*",
            "hodor-types/*",
            "**/target/*",
            "**/public/*",
            "**/.node-gyp/**",
        },
        sources = {
            files = {
                hidden = true,
            },
        },
        layout = "fzf",
        layouts = {
            fzf = {
                layout = {
                    box = "horizontal",
                    backdrop = false,
                    width = 0.99,
                    height = 0.99,
                    border = "none",
                    {
                        box = "vertical",
                        { win = "list", title = " Results ", title_pos = "center", border = true },
                        {
                            win = "input",
                            height = 1,
                            border = true,
                            title = "{title} {live} {flags}",
                            title_pos = "center",
                        },
                    },
                    {
                        win = "preview",
                        title = "{preview:Preview}",
                        width = 0.65,
                        border = true,
                        title_pos = "center",
                    },
                },
            },
        },
    },
    scroll = {
        enabled = true,

        animate = {
            duration = { step = 10, total = 100 },
            easing = "outCubic",
        },

        animate_repeat = {
            delay = 50,
            duration = { step = 5, total = 50 },
            easing = "outCubic",
        },
    },
})

vim.keymap.set("n", "<leader><leader>", function()
    snacks.picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>rg", function()
    snacks.picker.grep()
end, { desc = "Grep file contents" })
