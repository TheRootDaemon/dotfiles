return {
    "terrortylor/nvim-comment",
    keys = {
        { "<leader>/", ":CommentToggle<CR>", mode = { "n", "v" }}
    },
    config = function()
        require("nvim_comment").setup({ create_mappings = false })
    end,
}
