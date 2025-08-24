vim.g.lazyvim_check_order = false

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
