Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-tailwindcss',
  \ 'coc-svelte',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-yaml',
  \ 'coc-vimlsp',
  \ 'coc-svg',
  \ 'coc-actions',
  \ 'coc-lists',
  \ 'coc-json',
  \ 'coc-yank',
  \ 'coc-highlight',
  \ 'coc-solargraph',
  \ 'coc-styled-components',
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/stylelint')
  let g:coc_global_extensions += ['coc-stylelintplus']
endif

function! s:check_eslint()
  if !isdirectory('./node_modules') || !isdirectory('./node_modules/eslint')
    call coc#config('eslint', {
    \ 'enable': v:false,
    \ })
  endif
endfunction

autocmd BufEnter *.{js,jsx,ts,tsx} :call <SID>check_eslint()
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<c-g>u\<tab>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gt <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

" show documentation
function! s:show_documentation()
  if (CocHasProvider('hover'))
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <sid>show_documentation()<cr>

" show diagnostics, otherwise documentation, on hold
function! ShowDocIfNoDiagnostic(timer_id)
  if (CocHasProvider('hover'))
    if (coc#float#has_float() == 0)
      silent call CocActionAsync('doHover')
    endif
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" common editor actions
nmap <leader>rn <plug>(coc-rename)

" Formatting selected code.
nmap <silent> gf <Plug>(coc-format-selected)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)"

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <c-d> <plug>(coc-range-select)
xmap <silent> <c-d> <plug>(coc-range-select)


autocmd CursorHoldI * :call <sid>show_hover_doc()
autocmd CursorHold * :call <sid>show_hover_doc()

" common editor actions
nmap <leader>rn <plug>(coc-rename)

" Fix autofix problem of current line
nmap <leader>qf <plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap if <plug>(coc-funcobj-i)
omap af <plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <c-d> <plug>(coc-range-select)
xmap <silent> <c-d> <plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Show all diagnostics
nnoremap <silent> <space>d :<c-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e :<c-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c :<c-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o :<c-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s :<c-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<c-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent> <space>k :<c-u>CocPrev<cr>
" Resume latest coc list
nnoremap <silent> <space>p :<c-u>CocListResume<cr>

" actions menu
nmap <leader>m :CocCommand actions.open<cr>
nmap <c-a> :CocCommand actions.open<cr>
nmap <leader>do <plug>(coc-codeaction)

" command history
nmap <leader>h :CocList --top --number-select cmdhistory<cr>

" mru 
nmap <leader>r :CocList mru<cr>


" Use <c-space> to trigger completion.
if has('nvim')
  " map <silent> <c-space> <leader>cce"-yla<BS><c-r>-
   nmap <silent> <c-space> :CocCommand actions.open<cr>
else
  " map <silent> <c-@> <leader>cce"-yla<BS><c-r>-
   nmap <silent> <c-@> :CocCommand actions.open<cr>
endif

" Close all coc windows
nnoremap <leader>cc :cclose<cr>:pclose<cr>:call coc#util#float_hide()<cr>

" Restart coc
nnoremap <leader>cr :silent CocRestart<cr>
