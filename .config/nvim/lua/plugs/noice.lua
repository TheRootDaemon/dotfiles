require("noice").setup({
    lsp = {
        progress = {
            enabled = false,
        },
    },
    presets = {
        command_palette = true,
        long_message_to_split = true,
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                any = {
                    { find = "%d+L, %d+B" },
                    { find = "; after #%d+" },
                    { find = "; before #%d+" },
                },
            },
            view = "notify",
        },
    },
    views = {
        cmdline_popup = {
            position = {
                row = "20%",
                col = "50%",
            },
        },
    },
})

vim.keymap.set("n", "<leader>snh", function()
    require("noice").cmd("history")
end, { desc = "Show notification history" })
