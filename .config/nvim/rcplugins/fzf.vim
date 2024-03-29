Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" let g:fzf_preview_window = 'right:50%'
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let g:fzf_preview_window = ['down:40%', 'ctrl-/']

nmap <leader>fb :Buffers<CR> 
nmap <leader>f :Files<CR> 
nmap <C-p> :Files<Cr>

" command! -bang -nargs=* Ag call fzf#vim#ag_raw(<q-args> . '--recurse --ignore *docs', <bang>-1)
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
