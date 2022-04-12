" Mine

" no arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" For self-discipline (don't use/abuse arrow keys and traditions word processor conventions)
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" inoremap <del> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>

" Git
noremap <leader>gb :Git blame<CR>
noremap <leader>df :Gdiff<CR>

" NERDTree (file browser)
nmap <silent>:E<cr> :NERDTreeToggle<CR>
nmap <silent>:Explore<cr> :NERDTreeToggle<CR>
" Navigate to the currently open file in the file explorer
nnoremap <silent> <leader>n :NERDTreeFind<CR>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Formatting selected code.
nmap <silent> gf <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)"
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr>
"   \ pumvisible()
"   \ ? coc#_select_confirm()
"   \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Mappings (based on https://github.com/WilHall/.dotfiles/blob/main/.vim/rcfiles/mappings.vim)

" fold, unfold
nnoremap <leader>ff za
nnoremap <leader>FF zA

" Maps for folding, unfolding all
nnoremap <leader>fa zM<cr>
nnoremap <leader>Fa zR<cr>

" Marks
nnoremap m<leader> :delmarks a-zA-Z0-9<cr>

" shortcuts for substitutions
nnoremap <leader>sg :%s///g<left><left>
nnoremap <leader>sl :s///g<left><left>

" Make double-<Esc> clear search highlights
nnoremap <silent> <esc><esc> <esc>:nohlsearch<cr><esc>

" shortcut to edit file in the same directory as the current file
nnoremap <leader>e :e <c-r>=expand('%:p:h') . '/'<cr>

" buffer navigation
nnoremap <leader>, :silent! bp<cr>
nnoremap <leader>. :silent! bn<cr>
nnoremap <leader>; :silent! bd<cr>

" delete surrounding function
nmap <silent> dsf ds)db

" write current buffer to the clipboard
nmap <silent> <leader>cc :w !pbcopy<cr><cr>
