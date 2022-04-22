vim.api.nvim_command('au BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart')
vim.api.nvim_command('au BufLeave *.{js,jsx,ts,tsx} :syntax sync clear')
