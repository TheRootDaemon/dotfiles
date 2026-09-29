local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>m", function()
    harpoon:list():add()
end, { desc = "Add the current buffer to Harpoon" })

vim.keymap.set("n", "<leader>a", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "List harpooned buffers" })

vim.keymap.set("n", "<leader>1", function()
    harpoon:list():select(1)
end, { desc = "Harpoon to file 1" })

vim.keymap.set("n", "<leader>2", function()
    harpoon:list():select(2)
end, { desc = "Harpoon to file 2" })

vim.keymap.set("n", "<leader>3", function()
    harpoon:list():select(3)
end, { desc = "Harpoon to file 3" })

vim.keymap.set("n", "<leader>4", function()
    harpoon:list():select(4)
end, { desc = "Harpoon to file 4" })

vim.keymap.set("n", "<leader>5", function()
    harpoon:list():select(5)
end, { desc = "Harpoon to file 5" })

vim.keymap.set("n", "<leader>x", "<CMD>:bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>n", "<CMD>:bnext<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>b", "<CMD>:bprevious<CR>", { desc = "Next buffer" })
