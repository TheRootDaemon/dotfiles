local helpers = require("core.helpers")

vim.keymap.set("n", "<leader>a", "<CMD>:ls<CR>")
vim.keymap.set("n", "<leader>x", "<CMD>:bdelete<CR>")

vim.keymap.set("n", "<leader>n", "<CMD>:bnext<CR>")
vim.keymap.set("n", "<leader>b", "<CMD>:bprevious<CR>")

for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
        local bufnr = helpers.getBufId(i)
        if bufnr then
            vim.api.nvim_set_current_buf(bufnr)
        end
    end, { desc = "Switch to buffer " .. i })
end
