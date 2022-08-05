local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

-- list chars
cmd('hi Whitespace ctermfg=DarkGray guifg=#4a4a59')
cmd('hi NonText ctermfg=DarkGray guifg=#4a4a59')
cmd('hi SpecialKey ctermfg=DarkGray guifg=#4a4a59')
cmd('hi VisualListChars ctermfg=DarkGray guifg=#4a4a59')

-- Folds
cmd('hi Folded ctermfg=DarkGray guifg=#6a6a69')

-- Highlights
cmd('hi CocHoverRange term=bold ctermbg=0 guibg=#474e5d')
cmd('hi HighlightedyankRegion term=bold ctermbg=0 guibg=#474e5d')

-- Allow for terminal background transparency
cmd('hi Normal guibg=NONE ctermbg=NONE')
cmd('hi LineNr guibg=NONE ctermbg=NONE')
cmd('hi SignColumn guibg=NONE ctermbg=NONE')
cmd('hi ColorColumn guibg=DarkGray ctermbg=DarkGray')
cmd('hi CursorLine guibg=NONE ctermbg=NONE')
cmd('hi GitGutterAdd guibg=NONE')
cmd('hi GitGutterChange guibg=NONE')
cmd('hi GitGutterDelete guibg=NONE')
cmd('hi GitGutterChangeDelete guibg=NONE')

-- floating windows
cmd('hi VertSplit guibg=NONE')
cmd('hi NormalFloat guifg=#999999 guibg=#222222')
cmd('hi Pmenu guibg=#222222 guifg=#999999')
cmd('hi FzfBackground guibg=#282c34')

-- spell check
cmd('hi SpellBad cterm=undercurl gui=undercurl')

-- easy motion targets
cmd('hi EasyMotionTarget guifg=#f4b80f guibg=black')
