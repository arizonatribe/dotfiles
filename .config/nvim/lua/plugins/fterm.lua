vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').close, { bang = true })

vim.api.nvim_set_keymap('n', '<leader>ft', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true })

require("FTerm").setup({
    border = 'double',
    blend = 30
})
