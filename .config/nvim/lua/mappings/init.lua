-- Copy and paste with system clipboard

vim.api.nvim_set_keymap('v', '<C-c>', '"+y',    {noremap = true})
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', {noremap = true})

-- disable arrow keys in normal mode
vim.api.nvim_set_keymap('n', '<up>', '<nop>')
vim.api.nvim_set_keymap('n', '<down>', '<nop>')
vim.api.nvim_set_keymap('n', '<left>', '<nop>')
vim.api.nvim_set_keymap('n', '<right>', '<nop>')

-- Git
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', {noremap= true})
vim.api.nvim_set_keymap('n', '<leader>df', ':Gdiff<CR>', {noremap = true})

-- NERDTree (file browser)
vim.api.nvim_set_keymap('n', '<silent>:E<cr>', ':NERDTreeToggle<CR>', {noremap= true})
vim.api.nvim_set_keymap('n', '<silent>:Explore<cr>', ':NERDTreeToggle<CR>', {noremap = true})

-- Navigate to the currently open file in the file explorer
vim.api.nvim_set_keymap('n', '<silent>', '<leader>n :NERDTreeFind<CR>', {noremap = true})

-- Use <c-space> to trigger completion.
vim.api.nvim_set_keymap('n', '<silent><expr>', '<c-space> coc#refresh()', { noremap = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', '<silent>', '[g <Plug>(coc-diagnostic-prev)', {noremap = true})
vim.api.nvim_set_keymap('n', '<silent>', ']g <Plug>(coc-diagnostic-next)', {noremap = true})

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', '<silent>', 'gd <Plug>(coc-definition)', {noremap = true})
vim.api.nvim_set_keymap('n', '<silent>', 'gy <Plug>(coc-type-definition)', {noremap = true})
vim.api.nvim_set_keymap('n', '<silent>', 'gi <Plug>(coc-implementation)', {noremap = true})
vim.api.nvim_set_keymap('n', '<silent>', 'gr <Plug>(coc-references)', {noremap = true})

-- Formatting selected code.
vim.api.nvim_set_keymap('n', '<silent>', 'gf <Plug>(coc-format-selected)', {noremap = true})
-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('n', '<leader>ac', ' <Plug>(coc-codeaction)', {noremap = true})
-- Run the Code Lens action on the current line.
vim.api.nvim_set_keymap('n', '<leader>cl', ' <Plug>(coc-codelens-action)', {noremap = true})
-- Apply AutoFix to problem on the current line.
vim.api.nvim_set_keymap('n', '<leader>qf', ' <Plug>(coc-fix-current)', {noremap = true})

-- Mappings (based on https://github.com/WilHall/.dotfiles/blob/main/.vim/rcfiles/mappings.vim)

-- fold, unfold
vim.api.nvim_set_keymap('n', '<leader>ff', 'za', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>FF', 'zA', {noremap = true})

-- Maps for folding, unfolding all
vim.api.nvim_set_keymap('n', '<leader>fa', 'zM<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>Fa', 'zR<cr>', {noremap = true})

-- Marks
vim.api.nvim_set_keymap('n', 'm<leader>', ':delmarks a-zA-Z0-9<cr>', {noremap = true})

-- shortcuts for substitutions
vim.api.nvim_set_keymap('n', '<leader>sg', ':%s///g<left><left>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>sl', ':s///g<left><left>', {noremap = true})

-- Make double-<Esc> clear search highlights
vim.api.nvim_set_keymap('n', '<silent>', '<esc><esc> <esc>:nohlsearch<cr><esc>', {noremap = true})

-- shortcut to edit file in the same directory as the current file
vim.api.nvim_set_keymap('n', '<leader>e', ':e <c-r>=expand('%:p:h') . '/'<cr>', {noremap = true})

-- buffer navigation
vim.api.nvim_set_keymap('n', '<leader>,', ':silent! bp<cr>', {noremap= true})
vim.api.nvim_set_keymap('n', '<leader>.', ':silent! bn<cr>', {noremap= true})
vim.api.nvim_set_keymap('n', '<leader>;', ':silent! bd<cr>', {noremap= true})

-- delete surrounding function
vim.api.nvim_set_keymap('n', '<silent>', 'dsf ds)db', {noremap = true})

-- write current buffer to the clipboard
vim.api.nvim_set_keymap('n', '<silent>', '<leader>cc :w !pbcopy<cr><cr>', {noremap = true})
