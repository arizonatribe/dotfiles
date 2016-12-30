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

map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <bs> <nop>
inoremap <del> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

let homevim = $HOME . "/.vim/"
let dirplugins = homevim . "plugged"
let dirautoload = homevim . "autoload"
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
    Plug 'jiangmiao/auto-pairs'
    Plug 'geekq/vim-go'

    " Programming Language syntax highlighting
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }  
    Plug 'IN3D/vim-raml', { 'for': 'raml' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'othree/html5.vim'
    Plug 'othree/html5-syntax.vim'
    Plug 'groenewege/vim-less'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
    Plug 'jparise/vim-graphql'
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'scrooloose/syntastic', { 'for': ['php', 'javascript', 'python'] }
    Plug 'mxw/vim-jsx'
    Plug 'Quramy/vim-js-pretty-template'
    Plug 'jelera/vim-javascript-syntax'

    if executable("curl")
        Plug 'mattn/webapi-vim'
        Plug 'mattn/gist-vim'
    endif

    call plug#end()

    map <silent><C-n> :NERDTreeToggle<CR>
    autocmd vimenter * NERDTree
    autocmd BufNewFile,BufRead *.less set filetype=less
    autocmd FileType less set omnifunc=csscomplete#CompleteCSS
    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd BufRead,BufNewFile supervisord.conf setf dosini
endif

filetype plugin indent on

let g:ctrlp_custom_ignore = { 'dir': '\v[\/](\.git|node_modules)$' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:javascript_plugin_jsdoc = 1
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['python', 'javascript'],
                            \ 'passive_filetypes': [] }
let g:javascript_plugin_jsdoc = 1
let g:solarized_termcolors=256
let g:ackprg = 'ag --nogroup --nocolor --column'

set t_Co=256
set background=dark

if isdirectory(dircolors)
    colorscheme solarized
endif


