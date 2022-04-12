let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let g:ruby_host_prog = '/usr/bin/ruby'

let homevim = $HOME . "/.local/share/nvim/"
let myvimrc = $HOME . "/.config/nvim/init.vim"
let dirsite = homevim . "site"
let dirplugins = homevim . "plugged"
let dirautoload = dirsite . "/autoload"
let autoload_plug_file = dirautoload . "/plug.vim"
let dircolors = homevim . "colors"
let dirbackup = homevim . "backup"
let dirundo = homevim . "undo"
let dirswap = homevim . "swap"

if !isdirectory(homevim)
    call mkdir(homevim)
endif
if !isdirectory(dirplugins)
    call mkdir(dirplugins)
endif
if !isdirectory(dirsite)
    call mkdir(dirsite)
endif
if !isdirectory(dirautoload)
    call mkdir(dirautoload)
endif

let plug_install = 0
if empty(glob(autoload_plug_file))
    silent execute '!curl -fLo' . autoload_plug_file . ' --create-dirs '
        \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . autoload_plug_file
    let plug_install = 1
endif
if !isdirectory(dircolors)
    if isdirectory(dirplugins . "/vim-colorschemes")
        call mkdir(dircolors)
        execute "!cp " . dirplugins . "/vim-colorschemes/colors/* " . dircolors
    endif
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
set timeoutlen=375

" source core config files
function! s:SourceConfigFilesIn(directory)
  let directory_splat = $HOME . "/.config/nvim/" . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call plug#begin(dirplugins)
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

" source additional config files
filetype plugin on
call s:SourceConfigFilesIn('rcfiles')
