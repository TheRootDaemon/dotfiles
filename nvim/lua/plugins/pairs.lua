-- return {
--     "echasnovski/mini.pairs",
--     version = "*",
--     event = "InsertEnter",
--     config = function()
--         require("mini.pairs").setup({})
--     end
-- }

return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,
        })
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
