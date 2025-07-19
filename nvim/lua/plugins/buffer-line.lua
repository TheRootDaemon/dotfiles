return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    init = function()
        vim.keymap.set("n", "<leader>[", function()
            vim.cmd("BufferLineCyclePrev")
        end, { desc = "Previous buffer" })

        vim.keymap.set("n", "<leader>]", function()
            vim.cmd("BufferLineCycleNext")
        end, { desc = "Next buffer" })

        local function load_bufferline_if_needed()
            local listed = vim.tbl_filter(function(buf)
                return vim.bo[buf].buflisted
            end, vim.api.nvim_list_bufs())

            if #listed >= 2 then
                require("lazy").load({ plugins = { "bufferline.nvim" } })
                return true
            end
            return false
        end

        vim.schedule(load_bufferline_if_needed)

        vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter" }, {
            callback = function()
                load_bufferline_if_needed()
            end,
        })
    end,
    config = function()
        require("bufferline").setup({})
    end,
}
