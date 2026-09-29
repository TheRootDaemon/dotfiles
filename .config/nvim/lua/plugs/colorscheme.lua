require("vague").setup({
    colors = { plus = "#9ccfd8" },
})
vim.cmd.colorscheme("vague")

-- keep string literals non-italic
vim.api.nvim_set_hl(0, "String", {
    italic = false,
    update = true,
})

--- Highlight groups that I like to be italicized.
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
    vim.api.nvim_set_hl(0, name, {
        italic = true,
        update = true,
    })
end

--- Highlight groups that I like to be transparent.
local transparent_hls = {
    "DiagnosticSignError",
    "DiagnosticSignWarn",
    "DiagnosticSignInfo",
    "DiagnosticSignHint",
    "DiagnosticSignOk",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
    "MsgArea",
    "MsgSeparator",
}

-- preserve each group's existing style,
-- then make the background nil
for _, name in ipairs(transparent_hls) do
    vim.api.nvim_set_hl(0, name, {
        bg = "NONE",
        update = true,
    })
end

-- nitpicks
vim.api.nvim_set_hl(0, "EndOfBuffer", {
    bold = true,
    update = true,
})
