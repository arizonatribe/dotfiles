local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- select last pasted text
map('n', 'gb', '`[v`]')

-- misc
map('x', '>', '>gv')
map('x', '<', '<gv')

-- map('', 'vv', 'V')

-- insert clipboard content without messing up indentation
map('i', '<C-;>', '<C-r><C-p>*')
map('c', '<C-;>', '<C-r><C-p>*')

map('', '<leader>c', '"+y') -- Copy to clipboard in normal mode
map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights

-- Copy and paste with system clipboard
map('v', '<C-c>', '"+y')
map('i', '<C-v>', '<C-r>+')

-- disable arrow keys in normal mode
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('n', '<right>', '<nop>')

-- Git
map('n', '<leader>gb', ':Git blame<CR>')
map('n', '<leader>df', ':Gdiff<CR>')

-- NERDTree (file browser)
-- map('n', ':E<cr>', ':NERDTreeToggle<CR>')
-- map('n', ':Explore<cr>', ':NERDTreeToggle<CR>')

-- Mappings (based on https://github.com/WilHall/.dotfiles/blob/main/.vim/rcfiles/mappings.vim)

-- fold, unfold
map('n', '<leader>fo', 'za')
map('n', '<leader>uf', 'zA')

-- Maps for folding, unfolding all
map('n', '<leader>fa', 'zM<cr>')
map('n', '<leader>ua', 'zR<cr>')

-- Marks
map('n', 'm<leader>', ':delmarks a-zA-Z0-9<cr>')

-- shortcuts for substitutions
map('n', '<leader>sg', ':%s///g<left><left>')
map('n', '<leader>sl', ':s///g<left><left>')

-- Make double-<Esc> clear search highlights
map('n', '<silent>', '<esc><esc> <esc>:nohlsearch<cr><esc>')

-- shortcut to edit file in the same directory as the current file
-- map('n', '<leader>e', ':e <c-r>=expand('%:p:h') . '/'<cr>')

-- buffer navigation
map('n', '<leader>,', ':silent! bp<cr>')
map('n', '<leader>.', ':silent! bn<cr>')
map('n', '<leader>;', ':silent! bd<cr>')

-- delete surrounding function
map('n', '<silent>', 'dsf ds)db')

-- write current buffer to the clipboard
map('n', '<silent>', '<leader>cc :w !pbcopy<cr><cr>')
