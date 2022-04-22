local home = os.getenv("HOME")

-- Global variables
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1
vim.g.ruby_host_prog = '/usr/bin/ruby'

-- Misc options
vim.opt.clipboard = 'unnamedplus'
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.nocompatible = true
vim.opt.showcmd = true
vim.opt.timeoutlen = 375
vim.opt.updatetime = 100

-- backup/swap
vim.opt.nobackup = true
vim.opt.nowritebackup = true
vim.opt.backupdir = home + '/.local/share/nvim/backup/'
vim.opt.directory = home + '/.local/share/nvim/swap/'

-- auto reading/writing
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autowriteall = true

-- undo
vim.opt.undofile = true
vim.opt.undodir = home + '/.local/share/nvim/undo'
vim.opt.undolevels = 10000
vim.opt.undoreload = 20000

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Search through every directory and subdirectory
vim.opt.path = vim.opt.path + '**'
vim.opt.wildignore = vim.opt.wildignore + '*/node_modules/*,*.so,*.swp'

-- completion
vim.opt.completeopt = 'menu,menuone,preview'

-- folding
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 999

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- gutters
vim.opt.title = true
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- whitespace
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.backspace = 2
vim.opt.nojoinspaces = true
vim.opt.textwidth = 0
vim.opt.autoindent = true
vim.opt.copyindent = true

-- wrapping / line length
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.nofixendofline = true

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
