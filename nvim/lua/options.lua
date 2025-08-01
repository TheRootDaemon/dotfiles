-- Use system clipboard for all operations
vim.opt.clipboard = "unnamedplus"

-- Blocky cursor all the time
vim.o.guicursor = ""

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation configs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- Search configs
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep 8 lines visible above/below the cursor
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- File Handling
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable true color support
vim.opt.termguicolors = true
vim.opt.mouse = "a"

-- Set <Space> as the leader key
vim.g.mapleader = " "

-- Nerd Font Support
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0

-- Some essentials
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>:wqa<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>:qa!<CR>")

-- Clear search highlight with <Esc>
vim.keymap.set("n", "<leader>f", ":%s/")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move selected lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when navigating search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Tmux Navigation Integration
vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>")

-- Forcing myself to not use arrow keys
for _, mode in pairs({ "n", "i", "v" }) do
    vim.keymap.set(mode, "<Up>", "<Nop>", { noremap = true, silent = true })
    vim.keymap.set(mode, "<Down>", "<Nop>", { noremap = true, silent = true })
    vim.keymap.set(mode, "<Left>", "<Nop>", { noremap = true, silent = true })
    vim.keymap.set(mode, "<Right>", "<Nop>", { noremap = true, silent = true })
end
