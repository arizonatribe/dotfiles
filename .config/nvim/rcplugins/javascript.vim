" Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx']}
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript.tsx'] }
Plug 'flowtype/vim-flow'
" Plug 'wokalski/autocomplete-flow'
" Plug 'steelsojka/deoplete-flow'

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:javascript_plugin_flow = 1
let g:flow#autoclose = 1
let g:flow#timeout = 5
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif
let g:deoplete#enable_at_startup = 1

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
