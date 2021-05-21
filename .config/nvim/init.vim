set nocompatible
filetype off
syntax enable

" Search through every directory and subdirectory
set path+=**

set relativenumber
set clipboard=unnamed
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set textwidth=80
set hlsearch
set number
set title
set wildignore+=*/node_modules/*,*.so,*.swp
set autoindent
set copyindent
set shiftwidth=2
set redrawtime=10000

let homevim = $HOME . "/.local/share/nvim/"
let dirsite = homevim . "site"
let dirplugins = homevim . "plugged"
let dirautoload = dirsite . "/autoload"
let dircolors = homevim . "colors"
let dirbackup = homevim . "backup"
let dirundo = homevim . "undo"
let dirswap = homevim . "swap"

" Load vim-plug
if !isdirectory(homevim)
    call mkdir(homevim)
endif
if !isdirectory(dircolors)
    if isdirectory(dirplugins . "/vim-colorschemes")
        call mkdir(dircolors)
        execute "!cp " . dirplugins . "/vim-colorschemes/colors/* " . dircolors
    endif
endif
if !isdirectory(dirplugins)
    call mkdir(dirplugins)
endif
if !isdirectory(dirautoload)
    call mkdir(dirautoload)
endif
if empty(glob(dirautoload . "/plug.vim"))
    execute "!curl -fLo " . dirautoload . "/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim"
endif
if !isdirectory(dirbackup)
    call mkdir(dirbackup)
endif
if !isdirectory(dirundo)
    call mkdir(dirundo)
endif
if !isdirectory(dirswap)
    call mkdir(dirswap)
endif

set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set undodir=~/.local/share/nvim/undo//

set pastetoggle=<F2>

command! E Explore

command! -bang -nargs=* Ag
            \ call fzf#vim#ag_raw(<q-args> . '--recurse --ignore *docs', <bang>0)

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" command! -bang -nargs=+ -complete=dir Rag
"         \ call fzf#vim#ag_raw(<q-args>. '--recurse --ignore-dir={node_modules,docs}',
"         \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" command! -nargs=+ -complete=file AgRaw call fzf#vim#ag_raw(<q-args> . '--ignore docs --ignore node_modules')

" command! -nargs=+ -complete=file A call fzf#vim#ag_raw(<q-args> . '--ignore-dir=docs')?


" command! -bang -nargs=+ -complete=dir Rag 
"         \ call fzf#vim#ag_raw(<q-args>. '--recurse --ignore-dir={node_modules,docs}',
"         \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nmap <F8> :TagbarToggle<CR>

noremap <leader>gb :Gblame<CR>
noremap <leader>df :Gdiff<CR>

"Show type info (and short doc) of identifier under cursor.
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>
"gd Show type info (and short doc) of identifier under cursor.
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
"gf Formats code in normal mode
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <leader>f :Files<CR> 
nnoremap <silent> <leader>n :NERDTreeFind<CR>
nnoremap <C-p> :Files<Cr>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <del> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

call plug#begin(dirplugins)

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'flazz/vim-colorschemes'
Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-conflicted'
Plug 'ervandew/supertab'
Plug 'vim-scripts/CursorLineCurrentWindow'
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh && npm install -g flow-bin' }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }


" Programming Language syntax highlighting
Plug 'w0rp/ale'
Plug 'hail2u/vim-css3-syntax'
" Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'css', 'less', 'scss', 'json', 'graphql'] }
" Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript']}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'wokalski/autocomplete-flow'
Plug 'steelsojka/deoplete-flow'
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx','typescript'], 'do': 'make install' }
Plug 'davidhalter/jedi-vim'
Plug 'sheerun/vim-polyglot'
Plug 'flowtype/vim-flow'
Plug 'stephenway/postcss.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'jparise/vim-graphql'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


if executable("curl")
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
endif

call plug#end()

nmap <silent>:E<cr> :NERDTreeToggle<CR>
nmap <silent>:Explore<cr> :NERDTreeToggle<CR>
autocmd BufNewFile,BufRead *.less set filetype=less
" Disables E211 warnings when switching git branches and non-existant files still opened in some panes
autocmd FileChangedShell * execute

" An aggressive setting (keep in mind when debugging any potential sluggishness) https://jacky.wtf/weblog/language-client-and-neovim/
" autocmd BufEnter  *  call ncm2#enable_for_buffer()
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufRead,BufNewFile */supervisor/*.conf setf dosini
autocmd BufRead,BufNewFile supervisor.conf setf dosini
autocmd BufRead,BufNewFile supervisord.conf setf dosini
autocmd BufRead,BufNewFile *.nginx setf nginx
autocmd BufRead,BufNewFile nginx.conf setf nginx
autocmd BufRead,BufNewFile */nginx/*.conf setf nginx
autocmd BufRead,BufNewFile */usr/local/nginx/conf/*.conf setf nginx

filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set nofoldenable
set completeopt=noinsert,menuone,noselect

let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:flow#autoclose = 1
let g:flow#timeout = 5
let g:prettier#exec_cmd_async = 1
let g:vim_svelte_plugin_use_typescript = 1

let g:ackprg = 'ag --nogroup --column'
let g:netrw_liststyles=3
let g:jedi#popup_on_dot = 0
let g:jedi#force_py_version = 3

let g:neosnippet#enable_completed_snippet = 1

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

let g:neosolarized_contrast = "low"
let g:airline_theme = "molokai"

let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 120
let g:prettier#config#tab_width = 2
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'flow'

let s:LSP_CONFIG = {
\  'flow': {
\    'command': exepath('flow'),
\    'args': ['lsp'],
\    'filetypes': ['javascript', 'javascriptreact'],
\    'initializationOptions': {},
\    'requireRootPattern': 1,
\    'settings': {},
\    'rootPatterns': ['.flowconfig']
\  }
\}

let s:languageservers = {}
for [lsp, config] in items(s:LSP_CONFIG)
  let s:not_empty_cmd = !empty(get(config, 'command'))
  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
endif

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['flow-language-server', '--stdio']
\}
let b:ale_linters = {
  \ 'python': ['flake8', 'pylint'],
  \ 'javascript': ['flow', 'flow-language-server', 'eslint'],
  \ 'css': ['stylelint']
\}
let g:ale_fixers = {
  \ 'javascript': ['remove_trailing_lines', 'trim_whitespace', 'eslint'],
  \ 'css': ['stylelint']
\}

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

let g:ale_fix_on_save = 1
let g:ale_sign_warning = '⚡️'
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --parser flow --semi false --print-width 120 --tab-width 2'
let g:ale_statusline_format = ['{%d} error(s)', '{%d} warning(s)', '']
let g:ale_lint_on_text_changed = 'normal' " Slows down things if it's always linting
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%: "%code%"] %s [%severity%]'
let g:deoplete#enable_at_startup = 1
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

set t_Co=256
set background=dark
if has("termguicolors") && has("nvim")
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif
if isdirectory(dircolors)
    colorscheme gruvbox
    " colorscheme NeoSolarized
    " colorscheme lizard
    " colorscheme obsidian
    " colorscheme zenburn
    " colorscheme jellybeans
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE
endif
