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
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        cmp.setup({
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "buffer",  keyword_length = 3 },
                { name = "luasnip", keyword_length = 2 },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            formatting = {
                fields = { "abbr", "menu", "kind" },
                format = function(entry, item)
                    local source_name = entry.source.name
                    item.menu = source_name == "nvim_lsp" and "[LSP]" or string.format("[%s]", source_name)
                    return item
                end,
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
