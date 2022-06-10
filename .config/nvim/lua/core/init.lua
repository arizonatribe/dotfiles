local home = os.getenv("HOME")
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Global variables
g.did_load_filetypes = 0
g.do_filetype_lua = 1
g.python_host_prog = '/usr/bin/python'
g.python3_host_prog = '/usr/bin/python3'
g.python_host_skip_check = 1
g.python3_host_skip_check = 1
g.ruby_host_prog = '/usr/bin/ruby'

opt.termguicolors = true

-- list settings
opt.list = true
opt.showbreak = '↪\\'
opt.listchars = 'tab:→\\ ,eol:¬,space:·,nbsp:␣,trail:·,extends:⟩,precedes:⟨'

-- Misc options
opt.clipboard = 'unnamedplus'
opt.hidden = true
opt.laststatus = 2
opt.showcmd = true
opt.timeoutlen = 375
opt.updatetime = 100

-- backup/swap
opt.backup = false
opt.writebackup = false
opt.backupdir = home .. '/.local/share/nvim/backup/'
opt.directory = home .. '/.local/share/nvim/swap/'

-- auto reading/writing
opt.autoread = true
opt.autowrite = true
opt.autowriteall = true

-- undo
opt.undofile = true
opt.undodir = home .. '/.local/share/nvim/undo'
opt.undolevels = 10000
opt.undoreload = 20000

-- searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Search through every directory and subdirectory
-- opt.path = vim.opt.path + '**'
-- opt.wildignore = vim.opt.wildignore + '*/node_modules/*,*.so,*.swp'

-- completion
opt.completeopt = 'menu,menuone,preview'

-- folding
opt.foldenable = true
opt.foldmethod = 'indent'
opt.foldlevel = 999

-- splits
opt.splitbelow = true
opt.splitright = true

-- gutters
opt.title = true
opt.number = true
opt.numberwidth = 5
opt.relativenumber = true
opt.signcolumn = 'yes'

-- whitespace
opt.tabstop = 2
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true
opt.joinspaces = false
opt.textwidth = 0
opt.autoindent = true
opt.copyindent = true

-- wrapping / line length
opt.linebreak = true
opt.wrap = true
opt.fixendofline = false

-- Auto commands
vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
vim.api.nvim_command('au FileChangedShell * execute')
vim.api.nvim_command('au Filetype gitcommit setlocal spell textwidth=72')
vim.api.nvim_command('au FocusGained,BufEnter * :checktime')
vim.api.nvim_command('au VimResized * | set columns=120')
-- automatically rebalance windows on vim resize
vim.api.nvim_command('au VimResized * :wincmd =')
-- show cursorline in insert mode
vim.api.nvim_command('au InsertEnter,InsertLeave * set cursorline!')
