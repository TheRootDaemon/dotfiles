vim.opt.mouse = "a"
vim.g.mapleader = " "
vim.o.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

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
vim.opt.wrap = true
vim.opt.breakindent = true

-- File Handling
vim.opt.swapfile = false
vim.opt.backup = false

-- Nerd Font Support
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0

-- Some essentials
vim.keymap.set("n", "<leader>w", "<CMD>:w<CR>")
vim.keymap.set("n", "<leader>q", "<CMD>:q<CR>")
vim.keymap.set("n", "<leader>wq", "<CMD>:wqa<CR>")
vim.keymap.set("n", "<leader>so", "<CMD>:source %<CR>")
vim.keymap.set("n", "<leader>l", "<CMD>:.lua<CR>")
vim.keymap.set("n", "<leader>U", "<CMD>:lua vim.pack.update()<CR>")

-- Clear search highlight with <Esc>
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")
vim.keymap.set("n", "<leader>f", ":%s/")

-- Move selected lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when navigating search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
