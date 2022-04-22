vim.opt.termguicolors = true
vim.opt.t_Co = 256

-- color settings
local &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
local &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

-- underline settings
local &t_Cs = "\e[4:3m"
local &t_Ce = "\e[4:0m"

vim.cmd("colorscheme onehalfdark")

-- cursor settings
local &t_SI = &t_SI + "\e[5 q"
local &t_SR = &t_SR + "\e[4 q"
local &t_EI = &t_EI + "\e[1 q"

-- list settings
vim.opt.list = true
vim.opt.showbreak = '↪\\'
vim.opt.listchars = 'tab:→\\ ,eol:¬,space:·,nbsp:␣,trail:·,extends:⟩,precedes:⟨'

-- list chars
vim.cmd('hi Whitespace ctermfg=DarkGray guifg=#4a4a59')
vim.cmd('hi NonText ctermfg=DarkGray guifg=#4a4a59')
vim.cmd('hi SpecialKey ctermfg=DarkGray guifg=#4a4a59')
vim.cmd('hi VisualListChars ctermfg=DarkGray guifg=#4a4a59')
vim.cmd('match VisualListChars /\s/')

-- Folds
vim.cmd('hi Folded ctermfg=DarkGray guifg=#6a6a69')

-- Highlights
vim.cmd('hi CocHoverRange term=bold ctermbg=0 guibg=#474e5d')
vim.cmd('hi HighlightedyankRegion term=bold ctermbg=0 guibg=#474e5d')

-- Allow for terminal background transparency
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi LineNr guibg=NONE ctermbg=NONE')
vim.cmd('hi SignColumn guibg=NONE ctermbg=NONE')
vim.cmd('hi ColorColumn guibg=DarkGray ctermbg=DarkGray')
vim.cmd('hi CursorLine guibg=NONE ctermbg=NONE')
vim.cmd('hi GitGutterAdd guibg=NONE')
vim.cmd('hi GitGutterChange guibg=NONE')
vim.cmd('hi GitGutterDelete guibg=NONE')
vim.cmd('hi GitGutterChangeDelete guibg=NONE')

-- floating windows
vim.cmd('hi VertSplit guibg=NONE')
vim.cmd('hi NormalFloat guifg=#999999 guibg=#222222')
vim.cmd('hi Pmenu guibg=#222222 guifg=#999999')
vim.cmd('hi FzfBackground guibg=#282c34')

-- spell check
vim.cmd('hi SpellBad cterm=undercurl gui=undercurl')

-- coc diagnostics
vim.cmd('hi CocErrorHighlight guifg=#c94940 gui=bold,undercurl cterm=bold,undercurl ')
vim.cmd('hi CocWarningHighlight guifg=#f4b80f gui=bold,undercurl cterm=bold,undercurl ')
vim.cmd('hi CocErrorFloat guifg=#c94940 gui=bold ')
vim.cmd('hi CocWarningFloat guifg=#f4b80f gui=bold ')

-- easy motion targets
vim.cmd('hi EasyMotionTarget guifg=#f4b80f guibg=black')
