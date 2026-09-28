require("rose-pine").setup({})
vim.cmd.colorscheme("rose-pine")

-- keep string literals non-italic
local string_hl = vim.api.nvim_get_hl(0, { name = "String", link = false })
string_hl.italic = false
vim.api.nvim_set_hl(0, "String", string_hl)

-- highlight groups that I like to be italicized
local italic_hls = {
    "Comment",
    "@parameter",
    "htmlItalic",
    "@variable",
    "@variable.builtin",
    "@variable.parameter",
    "@variable.parameter.builtin",
    "@property",
    "@markup.italic",
    "NeogitChangeAdded",
    "NeogitChangeBothModified",
    "NeogitChangeCopied",
    "NeogitChangeDeleted",
    "CopilotSuggestion",
    "mkdCode",
    "NeogitChangeNewFile",
    "NeogitFilePath",
    "@text.emphasis",
    "NeogitChangeModified",
    "NeogitChangeRenamed",
    "NeogitChangeUpdated",
}

-- preserve each group's existing style,
-- then enable italics
for _, name in ipairs(italic_hls) do
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    if hl then
        hl.italic = true
        vim.api.nvim_set_hl(0, name, hl)
    end
end

-- highlight groups that I do not like having a background
local transparent_highlight_groups = {
    "DiagnosticSignError",
    "DiagnosticSignWarn",
    "DiagnosticSignInfo",
    "DiagnosticSignHint",
    "DiagnosticSignOk",
    "NoiceVirtualText",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
}

-- preserve each group's existing style,
-- then make the background nil
for _, name in ipairs(transparent_highlight_groups) do
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    if hl then
        hl.bg = nil
        vim.api.nvim_set_hl(0, name, hl)
    end
end
