local u = require("config.utils")

local luasnip = require("luasnip")

luasnip.filetype_extend("typescriptreact", { "typescript" })

u.imap("<C-e>", function()
    if luasnip.choice_active() then
        luasnip.change_choice()
    else
        u.input("<C-e>", "n")
    end
end)

u.imap("<C-j>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        u.input("<C-j>", "n")
    end
end)

u.imap("<C-k>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        u.input("<C-k>", "n")
    end
end)

require("config.snippets").load()
