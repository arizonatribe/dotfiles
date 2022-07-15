" Mine
"
" set nocompatible
" filetype off
" syntax enable

" set omnifunc=syntaxcomplete#Complete
" set nofoldenable
" set completeopt=noinsert,menuone,noselect

" Search through every directory and subdirectory
" set path+=**
" set relativenumber
" set clipboard=unnamed
" set tabstop=2
" set softtabstop=0
" set expandtab
" set shiftwidth=2
" set textwidth=120
" set hlsearch
" set number
" set title
" set wildignore+=*/node_modules/*,*.so,*.swp
" set autoindent
" set copyindent
" set redrawtime=10000

" General Vim Settings (based on https://github.com/WilHall/.dotfiles/blob/main/.vim/rcfiles/settings.vim)

syntax on

" Disables E211 warnings when switching git branches and non-existant files still opened in some panes
autocmd FileChangedShell * execute
autocmd Filetype gitcommit setlocal spell textwidth=72

" filetype plugin indent on

set nocompatible
set showcmd
" set clipboard=unnamed
set clipboard^=unnamed,unnamedplus
set hidden
set updatetime=100
set nobackup
set nowritebackup
set laststatus=2
set incsearch
set nofixendofline

" autoreading
set autoread
autocmd FocusGained,BufEnter * :checktime 

" autowriting
set autowrite
set autowriteall

" undo
set undofile
set undodir=$HOME/.local/share/nvim/undo
set undolevels=10000
set undoreload=20000

" searching
set ignorecase
set smartcase
set hlsearch
" Search through every directory and subdirectory
set path+=**
set wildignore+=*/node_modules/*,*.so,*.swp

" completion
set completeopt=menu,menuone,preview

" folding
set foldenable
set foldmethod=indent
set foldlevel=999

" splits
set splitbelow
set splitright

" gutters
set number
set numberwidth=5
set relativenumber
set signcolumn=yes

" whitespace
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set backspace=2
set nojoinspaces
set textwidth=0
set autoindent
set copyindent

" wrapping / line length
set linebreak
set wrap
autocmd VimResized * | set columns=120

" create interstitial directories when saving files
augroup CreateDirsOnSave
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

command! E Explore

