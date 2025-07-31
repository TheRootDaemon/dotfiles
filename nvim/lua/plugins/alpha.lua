return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "catppuccin/nvim" },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local catppuccin = require("catppuccin.palettes").get_palette()

        dashboard.section.header.val = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "As long as I live, There are Infinite Chances !",
            "",
            "                   ~ Monkey D. Luffy"
        }
        dashboard.section.header.opts.hl = "AlphaHeader"

        dashboard.section.buttons.val = {
            dashboard.button("1", "  New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("2", "󰒲  Lazy", ":Lazy<CR>"),
            dashboard.button("3", "  Lazy Update", ":Lazy update<CR>"),
            dashboard.button("4", "  Lazy Clean", ":Lazy clean<CR>"),
            dashboard.button("5", "  Quit", ":qa<CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.buttons.opts.hl = "AlphaButtons"

        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = catppuccin.pink, bold = true, italic = true })
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = catppuccin.blue })
        vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = catppuccin.teal })
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = catppuccin.maroon, italic = true })

        dashboard.section.footer.opts.hl = "AlphaFooter"

        dashboard.opts.layout[1].val = 0

        return dashboard
    end,
    config = function(_, dashboard)
        vim.keymap.set("n", "<leader>h", ":Alpha<CR>")

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = {
                    "",
                    "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
