vim.opt.mouse = "a"
vim.opt.ruler = false
vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0

-- indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- search configs
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep 8 lines visible above/below the cursor
vim.opt.scrolloff = 8
vim.opt.wrap = true
vim.opt.breakindent = true

-- file Handling
vim.opt.swapfile = false
vim.opt.backup = false

-- some essentials
vim.keymap.set("n", "<leader>Q", "<CMD>:q<CR>")
vim.keymap.set("n", "<leader>q", "<CMD>:q<CR>")
vim.keymap.set("n", "<leader>wq", "<CMD>:wqa<CR>")
vim.keymap.set("n", "<leader>s", "<CMD>:source %<CR>")
vim.keymap.set("n", "<leader>l", "<CMD>:.lua<CR>")

-- clipboard options
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

-- clear search highlight with <Esc>
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")
vim.keymap.set("n", "<leader>f", ":%s/")

-- move selected lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor centered when navigating search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- motions for panes
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- resize panes
vim.keymap.set("n", "<leader>H", "<C-w>2>")
vim.keymap.set("n", "<leader>J", "<C-w>2-")
vim.keymap.set("n", "<leader>K", "<C-w>2+")
vim.keymap.set("n", "<leader>L", "<C-w>2<")

-- annoying motions
vim.cmd([[
    cnoreabbrev W w
    cnoreabbrev Q q

    cnoreabbrev W! w!
    cnoreabbrev Q! q!

    cnoreabbrev Wq wq
    cnoreabbrev WQ wq

    cnoreabbrev Wq! wq!
    cnoreabbrev WQ! wq!

    cnoreabbrev Wqa wqa
    cnoreabbrev WQa wqa
    cnoreabbrev WQA wqa

    cnoreabbrev Wqa! wqa!
    cnoreabbrev WQa! wqa!
    cnoreabbrev WQA! wqa!
]])
