require("core.opts")
require("core.pack")
require("core.lspconfig")

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
    callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        if normal.bg then
            io.write(string.format("\027]11;#%06x\027\\", normal.bg))
        end
    end,
})

vim.api.nvim_create_autocmd("UILeave", {
    callback = function()
        io.write("\027]111\027\\")
    end,
})
