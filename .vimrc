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

let homevim = $HOME . "/.vim/"
let dirplugins = homevim . "plugged"
let dirautoload = homevim . "autoload"
let dircolors = homevim . "colors"
let dirbackup = homevim . "backup"
let dirundo = homevim . "undo"
let dirswap = homevim . "swap"
let mapleader = ","

" Load vim-plug
if !isdirectory(homevim)
    call mkdir(homevim)
endif
if !isdirectory(dircolors)
    if isdirectory(dirplugins . "/vim-colorschemes")
        call mkdir(dircolors)
        execute "!cp ~/.vim/plugged/vim-colorschemes/colors/* ~/.vim/colors"
    endif
endif
if !isdirectory(dirplugins)
    call mkdir(dirplugins)
endif
if !isdirectory(dirautoload)
    call mkdir(dirautoload)
    execute "!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim"
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

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set pastetoggle=<F2>

command! E Explore

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nmap <F8> :TagbarToggle<CR>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <del> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <leader>f :Fixmyjs<CR>

if !empty(glob("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.vim/plugged')

    Plug 'flazz/vim-colorschemes'
    Plug 'tpope/vim-git', { 'for': 'git' }
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-obsession'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-scripts/CursorLineCurrentWindow'
    Plug 'mileszs/ack.vim'
    Plug 'vim-scripts/nginx.vim'

    " Programming Language syntax highlighting
    Plug 'fatih/vim-go'
    Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'othree/html5.vim'
    Plug 'othree/html5-syntax.vim'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'ajh17/VimCompletesMe'
    Plug 'majutsushi/tagbar'
    Plug 'jparise/vim-graphql'
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'vim-syntastic/syntastic'
    Plug 'mxw/vim-jsx'
    Plug 'Quramy/vim-js-pretty-template'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'ruanyl/vim-fixmyjs'

    if executable("curl")
        Plug 'mattn/webapi-vim'
        Plug 'mattn/gist-vim'
    endif

    call plug#end()

    nmap <silent>:E<cr> :NERDTreeToggle<CR>
    nmap <silent>:Explore<cr> :NERDTreeToggle<CR>
    autocmd vimenter * NERDTree
    autocmd BufNewFile,BufRead *.less set filetype=less
    autocmd FileType less set omnifunc=csscomplete#CompleteCSS
    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd BufRead,BufNewFile supervisord.conf setf dosini
endif

filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ctrlp_custom_ignore = { 'dir': '\v[\/](\.git|node_modules)$' }
let g:javascript_plugin_jsdoc = 1
let g:solarized_termcolors=256
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:netrw_liststyles=3

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set nofoldenable

set t_Co=256
set background=dark

if isdirectory(dircolors)
    colorscheme solarized
endif


