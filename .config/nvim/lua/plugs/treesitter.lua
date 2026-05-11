require("nvim-treesitter").setup({
    auto_install = true,
})

local ensure_installed = {
    "bash",
    "c",
    "css",
    "cpp",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "nix",
    "python",
    "svelte",
    "toml",
    "tsx",
    "typescript",
    "yaml",
}

local already_installed = require("nvim-treesitter.config").get_installed()
local parsers_to_install = vim.iter(ensure_installed)
    :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
    end)
    :totable()
require("nvim-treesitter").install(parsers_to_install)

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "c",
        "css",
        "cpp",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "nix",
        "python",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    },
    callback = function()
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd("PackChanged", {
    group = vim.api.nvim_create_augroup("RunTSUpdate", { clear = true }),
    callback = function(event)
        if event.data.kind == "update" then
            vim.schedule(function()
                pcall(function()
                    vim.cmd("TSUpdate")
                end)
            end)
        end
    end,
})
