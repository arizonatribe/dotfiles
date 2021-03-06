set nocompatible
filetype off
syntax enable

" Search through every directory and subdirectory
set path+=**

set relativenumber
set clipboard=unnamed
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set textwidth=80
set hlsearch
set number
set title
set wildignore+=*/node_modules/*,*.so,*.swp
set autoindent
set copyindent
set shiftwidth=4

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

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nmap <F8> :TagbarToggle<CR>

noremap <leader>gb :Gblame<CR>
" noremap <leader>gd :Gdiff<CR>
noremap <leader>df :Gdiff<CR>

nnoremap <silent>K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent>gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'heavenshell/vim-jsdoc'

" Programming Language syntax highlighting
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'sheerun/vim-polyglot'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'stephenway/postcss.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'

" (Optional) Multi-entry selection UI.
" Plug 'junegunn/fzf'
Plug 'Shougo/denite.nvim'

if executable("curl")
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
endif

call plug#end()

nmap <silent>:E<cr> :NERDTreeToggle<CR>
nmap <silent>:Explore<cr> :NERDTreeToggle<CR>
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufRead,BufNewFile */supervisor/*.conf setf dosini
autocmd BufRead,BufNewFile supervisor.conf setf dosini
autocmd BufRead,BufNewFile supervisord.conf setf dosini
autocmd BufRead,BufNewFile *.nginx setf nginx
autocmd BufRead,BufNewFile nginx.conf setf nginx
autocmd BufRead,BufNewFile */nginx/*.conf setf nginx
autocmd BufRead,BufNewFile */usr/local/nginx/conf/*.conf setf nginx

filetype plugin indent on

set nofoldenable

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:used_javascript_libs = 'ramda,d3,react,jasmine,flux'
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:netrw_liststyles=3
let g:jedi#popup_on_dot = 0
let g:jedi#force_py_version = 3
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:neosolarized_contrast = "low"
let g:airline_theme = "molokai"

let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'

let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }
let g:LanguageClient_autoStart = 1
let b:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ 'javascript': ['eslint'],
\}
let g:ale_fixers = {
    \ 'javascript': ['eslint']
\}
let g:ale_fix_on_save = 1

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
