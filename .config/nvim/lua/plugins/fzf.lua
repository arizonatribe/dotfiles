vim.g.fzf_preview_window = {'down:40%', 'ctrl-/'}

vim.api.nvim_set_keymap('n', '<leader>fb', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<Cr>', {noremap = true})
