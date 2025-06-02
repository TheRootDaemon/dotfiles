return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<M-a>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<M-1>", function()
            ui.nav_file(1)
        end)
        vim.keymap.set("n", "<M-2>", function()
            ui.nav_file(2)
        end)
        vim.keymap.set("n", "<M-3>", function()
            ui.nav_file(3)
        end)
        vim.keymap.set("n", "<M-4>", function()
            ui.nav_file(4)
        end)
    end,
}
