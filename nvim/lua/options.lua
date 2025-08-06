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
vim.opt.scrolloff = 16
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
