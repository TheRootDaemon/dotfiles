local snacks = require("snacks")

snacks.setup({
    animate = { enabled = true },
    indent = { enabled = true },
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
