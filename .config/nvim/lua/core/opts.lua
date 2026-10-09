-- general configs
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
vim.opt.linebreak = true
vim.opt.breakindent = true

-- persist undo history
vim.opt.undofile = true

-- file handling
vim.opt.swapfile = false
vim.opt.backup = false

-- responsiveness
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- clipboard options
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank current line to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste content from system clipboard" })

-- clear search highlight with <Esc>
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>f", ":%s/", { desc = "Substitute (find/replace)" })

-- move selected lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- keep cursor centered when navigating search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

-- display
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = {
    tab = "> ",
    trail = "·",
    nbsp = "␣",
}

-- use rounded borders
vim.o.winborder = "rounded"
vim.o.pumborder = "rounded"

-- motions for panes
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Navigate to left pane" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Navigate to bottom pane" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Navigate to top pane" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Navigate to right pane" })

-- resize panes
vim.keymap.set("n", "<leader>H", "<C-w>2>", { desc = "Increase pane width" })
vim.keymap.set("n", "<leader>J", "<C-w>2-", { desc = "Decrease pane height" })
vim.keymap.set("n", "<leader>K", "<C-w>2+", { desc = "Increase pane height" })
vim.keymap.set("n", "<leader>L", "<C-w>2<", { desc = "Decrease pane width" })

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
