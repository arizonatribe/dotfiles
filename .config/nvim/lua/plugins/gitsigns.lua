local u = require("config.utils")

local gitsigns = require("gitsigns")

gitsigns.setup({
    on_attach = function(bufnr)
        -- navigation
        u.buf_map(bufnr, "n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        u.buf_map(bufnr, "n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

        -- actions
        u.buf_map(bufnr, { "n", "v" }, "<leader>hs", gitsigns.stage_hunk)
        u.buf_map(bufnr, { "n", "v" }, "<leader>hr", gitsigns.reset_hunk)
        u.buf_map(bufnr, "n", "<leader>hS", gitsigns.stage_buffer)
        u.buf_map(bufnr, "n", "<leader>hu", gitsigns.undo_stage_hunk)
        u.buf_map(bufnr, "n", "<leader>hR", gitsigns.reset_buffer)
        u.buf_map(bufnr, "n", "<leader>hp", gitsigns.preview_hunk)
        u.buf_map(bufnr, "n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
        end)

        -- text object
        u.buf_map(bufnr, { "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
})
