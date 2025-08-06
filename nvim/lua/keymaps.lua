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

-- Plugin related Keymaps
-- But the actual Keymaps are in the actual plugin config itself
-- For the sake of lazy loading, but you can refer to them here itself

-- Toggling Neo-Tree
-- Actual keymaps at lua/plugins/neo-tree.lua

-- vim.keymap.set("n", "<leader>e", ":Neotree toggle position=current<CR>")

-- Using Telescope
-- Actual keymaps at lua/plugins/telescope.lua

-- vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
-- vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})

-- Cycling through Bufferline
-- Actual keymaps at lua/plugins/buffer-line.lua

-- vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", {})
-- vim.keymap.set("n", "<leader>n", "<cmd>BufferLineCycleNext<CR>", {})
-- vim.keymap.set("n", "<leader>p", "<cmd>BufferLineCyclePrev<CR>", {})

-- Keymaps for LSP stuff
-- Actual keymaps at lua/plugins/lsp-config.lua

-- To hover docs
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))

-- To perform code actions
-- vim.keymap.set("n", "ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))

-- To go to definitions
-- vim.keymap.set(
--     "n",
--     "gd",
--     vim.lsp.buf.definition,
--     vim.tbl_extend("force", opts, { desc = "Go to Definition" })
-- )

-- To go to references
-- vim.keymap.set(
--     "n",
--     "gr",
--     vim.lsp.buf.references,
--     vim.tbl_extend("force", opts, { desc = "Go to References" })
-- )

-- To rename variables and stuff
-- vim.keymap.set(
--     "n",
--     "rn",
--     vim.lsp.buf.rename,
--     vim.tbl_extend("force", opts, { desc = "Rename symbols" })
-- )
