local cmp = require("cmp")

local snippy = require("snippy")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    completion = {
        completeopt = "menuone,noinsert,noselect",
    },
    snippet = {
        expand = function(args)
            snippy.expand_snippet(args.body)
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-e>"] = cmp.mapping(function()
            cmp.abort()
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.get_selected_entry() then
                cmp.confirm()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-Space"] = cmp.mapping(function()
            cmp.complete()
        end, { "i", "s" }),
    },
    sources = {
        -- only show one snippet, and always show at top
        { name = "snippy", priority = 9999, max_item_count = 1 },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "tmux" },
        {
            name = "buffer",
            option = {
                -- complete from visible buffers
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end,
            },
        },
    },
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
