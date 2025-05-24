return {
    "vimpostor/vim-tpipeline",
    config = function()
        vim.g.tpipeline_autoembed = 1
        vim.g.tpipeline_restore = 1
        vim.g.tpipeline_clearstl = 1
    end,
}
