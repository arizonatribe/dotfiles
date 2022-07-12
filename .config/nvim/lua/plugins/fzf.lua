-- Old Settings
vim.g.fzf_preview_window = {'down:40%', 'ctrl-/'}
vim.api.nvim_set_keymap('n', '<leader>fb', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<Cr>', {noremap = true})

local u = require("config.utils")

require("fzf-lua").setup({
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
    winopts = {
        height = 0.95,
        width = 0.95,
        preview = {
            scrollbar = false,
        },
    },
    fzf_opts = {
        ["--layout"] = "default",
    },
    files = {
        actions = {
            ["ctrl-e"] = function(selected)
                for i, item in ipairs(selected) do
                    local command = i == 1 and "edit" or i % 2 == 0 and "vsplit" or "split"
                    vim.cmd(string.format("%s %s", command, item))
                end
            end,
        },
    },
})

-- fzf.vim-like commands
u.command("Files", "FzfLua files")
u.command("Rg", "FzfLua live_grep_glob")
u.command("BLines", "FzfLua grep_curbuf")
u.command("GrepCword", "FzfLua grep_cWORD")
u.command("History", "FzfLua oldfiles")
u.command("Buffers", "FzfLua buffers")
u.command("BCommits", "FzfLua git_bcommits")
u.command("Commits", "FzfLua git_commits")
u.command("HelpTags", "FzfLua help_tags")
u.command("ManPages", "FzfLua man_pages")
u.command("GrepClipboard", function()
    -- remove newlines, since they'll break the search
    local search = vim.fn.getreg("*"):gsub("\n", "")
    require("fzf-lua").grep({ search = search })
end)

u.nmap("<Leader>ff", "<cmd>Files<CR>")
u.nmap("<Leader>fs", "<cmd>Rg<CR>")
u.nmap("<Leader>fh", "<cmd>HelpTags<CR>")
u.nmap("<Leader>fo", "<cmd>History<CR>")
u.nmap("<Leader>fw", "<cmd>GrepCword<CR>")
u.nmap("<Leader>fc", "<cmd>GrepClipboard<CR>")
u.nmap("<Leader><Leader>", "<cmd>Buffers<CR>")
u.nmap("<LocalLeader><LocalLeader>", "<cmd>BLines<CR>")

u.nmap("<Leader>gs", "<cmd>FzfLua git_status<CR>")
u.nmap("<Leader>gr", "<cmd>FzfLua git_branches<CR>")

u.command("LspRef", "FzfLua lsp_references")
u.command("LspSym", "FzfLua lsp_workspace_symbols")
u.command("LspAct", "FzfLua lsp_code_actions")
u.command("LspDef", function()
    require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
end)
