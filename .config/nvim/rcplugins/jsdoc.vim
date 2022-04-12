Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx','typescript'], 'do': 'make install' }

let g:javascript_plugin_jsdoc = 1
let g:jsdoc_allow_input_prompt = 1

command! -register JsDoc call jsdoc#insert()
