" Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'css', 'less', 'scss', 'json', 'graphql'] }

let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 120
let g:prettier#config#tab_width = 2
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'typescript'
