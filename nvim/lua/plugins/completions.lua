return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim"
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        cmp.setup({
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,preview,noinsert",
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            formatting = {
                fields = { "kind", "abbr" },
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = {
                        menu = 50,
                        abbr = 50,
                    },
                    ellipsis_char = "...",
                    show_labelDetails = true,
                    before = function(entry, vim_item)
                        vim_item.menu = nil
                        return vim_item
                    end,
                })
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-w>"] = cmp.mapping.scroll_docs(5),
                ["<C-s>"] = cmp.mapping.scroll_docs(-5),
                ["<C-e>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = "select" })
                    elseif
                        vim.fn.col(".") - 1 == 0
                        or vim.fn.getline("."):sub(vim.fn.col(".") - 1, vim.fn.col(".") - 1):match("%s")
                    then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
            }),
        })
    end,
}
