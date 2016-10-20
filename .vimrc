set nocompatible
filetype off
syntax enable

" Search through every directory and subdirectory
set path+=**

set t_Co=256
set background=dark
colorscheme kalahari

set relativenumber
set clipboard=unnamed
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set textwidth=80
set hlsearch

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set number
set title
set wildignore+=*/node_modules/*,*.so,*.swp

map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-n> :NERDTreeToggle<CR>
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

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute "mkdir -p ~/.vim/plugged"
    execute "mkdir -p ~/.vim/autoload"
    execute "!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim"
endif

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'ekalinin/Dockerfile.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }  
Plug 'jparise/vim-graphql'
Plug 'IN3D/vim-raml', { 'for': 'raml' }
Plug 'ternjs/tern_for_vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'edsono/vim-matchit', { 'for': ['html', 'xml'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/syntastic', { 'for': ['php', 'python', 'javascript', 'css'] }
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'rstacruz/sparkup'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

if executable("curl")
    Plug 'mattn/webapi-vim'
    Plug 'mattn/gist-vim'
endif

filetype plugin indent on
call plug#end()

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd vimenter * NERDTree
