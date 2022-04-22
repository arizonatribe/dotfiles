vim.g.coc_global_extensions = {
  'coc-css',
  'coc-json',
  'coc-tsserver',
  'coc-tailwindcss',
  'coc-svelte',
  'coc-go',
  'coc-html',
  'coc-yaml',
  'coc-vimlsp',
  'coc-svg',
  'coc-actions',
  'coc-lists',
  'coc-json',
  'coc-yank',
  'coc-highlight',
  'coc-solargraph',
  'coc-styled-components',
}

if vim.fn.isdirectory('./node_modules') && vim.fn.isdirectory('./node_modules/prettier') then
  table.insert(vim.g.coc_global_extensions, 'coc-prettier')
end

if vim.fn.isdirectory('./node_modules') && vim.fn.isdirectory('./node_modules/eslint') then
  table.insert(vim.g.coc_global_extensions, 'coc-eslint')
end

if vim.fn.isdirectory('./node_modules') && vim.fn.isdirectory('./node_modules/stylelint') then
  table.insert(vim.g.coc_global_extensions, 'coc-stylelintplus')
end

function check_eslint()
  if !vim.fn.isdirectory('./node_modules') || !vim.fn.isdirectory('./node_modules/eslint') then
    vim.cmd("coc#config('eslint', { 'enable': v:false, })"
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.cmd("CocAction('runCommand', 'editor.action.organizeImport')")
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.{js,jsx,ts,tsx}",
    callback = check_eslint,
})

-- don't give |ins-completion-menu| messages.
vim.opt.shortmess = vim.opt.shortmess + 'c'

-- Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
vim.api.nvim_set_keymap('n', '<expr> <tab>', 'complete_info()["selected"] != "-1" ? "\<c-y>" : "\<c-g>u\<tab>"', {noremap = true, silent = true})

-- Use `[g` and `]g` to navigate diagnostics
vim.api.nvim_set_keymap('n', '[g', '<plug>(coc-diagnostic-prev)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']g', '<plug>(coc-diagnostic-next)', {noremap = true, silent = true})

-- Remap keys for gotos
vim.api.nvim_set_keymap('n', 'gd', '<plug>(coc-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gt', '<plug>(coc-type-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<plug>(coc-implementation)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<plug>(coc-references)', {noremap = true, silent = true})

-- show documentation
function show_documentation()
  if (vim.cmd("CocHasProvider('hover')")) then
    vim.cmd("CocAction('doHover')")
  end
end
vim.api.nvim_set_keymap('n', 'K', '<sid>show_documentation()<cr>', {noremap = true, silent = true})

-- show diagnostics, otherwise documentation, on hold
function ShowDocIfNoDiagnostic(timer_id)
  if (vim.cmd("CocHasProvider('hover')")) then
    if (vim.cmd("coc#float#has_float()") == 0) then
      vim.cmd("CocActionAsync('doHover')")
    end
  end
end

vim.fn.ShowDocIfNoDiagnostic = ShowDocIfNoDiagnostic

function show_hover_doc()
  vim.fn.timer_start(500, 'ShowDocIfNoDiagnostic')
end

-- Use <c-space> to trigger completion.
if vim.fn.has('nvim') then
  vim.api.nvim_set_keymap('n', '<expr> <c-space>', 'coc#refresh()', {noremap = true, silent = true})
else
  vim.api.nvim_set_keymap('n', '<expr> <c-@>', 'coc#refresh()', {noremap = true, silent = true})
end

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {noremap = true, silent = true})

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = true, silent = true})

-- common editor actions
vim.api.nvim_set_keymap('n', '<leader>rn', '<plug>(coc-rename)', {noremap = true})

-- Formatting selected code.
vim.api.nvim_set_keymap('n', 'gf', '<Plug>(coc-format-selected)', {noremap = true, silent = true})

-- Run the Code Lens action on the current line.
vim.api.nvim_set_keymap('n', '<leader>cl', '<Plug>(coc-codelens-action)', {noremap = true})

-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', {noremap = true})
-- Apply AutoFix to problem on the current line.
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', {noremap = true})

-- Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
vim.api.nvim_set_keymap('n', '<c-d>', ':<plug>(coc-range-select)', {noremap = true})

vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = show_hover_doc,
})
vim.api.nvim_create_autocmd("CursorHoldI", {
    pattern = "*",
    callback = show_hover_doc,
})

-- common editor actions
vim.api.nvim_set_keymap('n', '<leader>rn', ':<plug>(coc-rename)', {noremap = true})

-- Fix autofix problem of current line
vim.api.nvim_set_keymap('n', '<leader>qf', ':<plug>(coc-fix-current)', {noremap = true})

-- Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap if <plug>(coc-funcobj-i)
omap af <plug>(coc-funcobj-a)

-- Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
vim.api.nvim_set_keymap('n', '<c-d>', ':<plug>(coc-range-select)', {noremap = true, silent = true})

-- Use `:Format` to format current buffer
vim.api.nvim_create_user_command("Format", {
    command = "CocAction('format')"
    bang = true
})

-- Use `:Fold` to fold current buffer
vim.api.nvim_create_user_command("Fold", {
    command = "CocAction('fold', <f-args>)"
    bang = true
})

-- use `:OR` for organize import of current buffer
vim.api.nvim_create_user_command("OR", {
    command = "CocAction('runCommand', 'editor.action.organizeImport')"
    bang = true
})

-- Show all diagnostics
vim.api.nvim_set_keymap('n', '<space>d', ':<c-u>CocList diagnostics<cr>', {noremap = true, silent = true})

-- Manage extensions
vim.api.nvim_set_keymap('n', '<space>e', ':<c-u>CocList extensions<cr>', {noremap = true, silent = true})

-- Show commands
vim.api.nvim_set_keymap('n', '<space>c', ':<c-u>CocList commands<cr>', {noremap = true, silent = true})

-- Find symbol of current document
vim.api.nvim_set_keymap('n', '<space>o', ':<c-u>CocList outline<cr>', {noremap = true, silent = true})

-- Search workspace symbols
vim.api.nvim_set_keymap('n', '<space>s', ':<c-u>CocList -I symbols<cr>', {noremap = true, silent = true})

-- Do default action for next item.
vim.api.nvim_set_keymap('n', '<space>j', ':<c-u>CocNext<cr>', {noremap = true, silent = true})

-- Do default action for previous item.

vim.api.nvim_set_keymap('n', '<space>k', ':<c-u>CocPrev<cr>', {noremap = true, silent = true})

-- Resume latest coc list
vim.api.nvim_set_keymap('n', '<space>p', ':<c-u>CocListResume<cr>', {noremap = true, silent = true})

-- actions menu
vim.api.nvim_set_keymap('n', '<leader>m', ':CocCommand actions.open<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-a>', ':CocCommand actions.open<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>do', '<plug>(coc-codeaction)', {noremap = true})

-- command history
vim.api.nvim_set_keymap('n', '<leader>h', ':CocList --top --number-select cmdhistory<cr>', {noremap = true})

-- mru 
vim.api.nvim_set_keymap('n', '<leader>r', ':CocList mru<cr>', {noremap = true})

-- Use <c-space> to trigger completion.
if vim.fn.has('nvim') then
    vim.api.nvim_set_keymap('n', '<c-space>', ':CocCommand actions.open<cr>', {noremap = true, silent = true})
else
    vim.api.nvim_set_keymap('n', '<c-@>', ':CocCommand actions.open<cr>', {noremap = true, silent = true})
end

-- Close all coc windows
vim.api.nvim_set_keymap('n', '<leader>cc', ':cclose<cr>:pclose<cr>:call coc#util#float_hide()<cr>', {noremap = true})

-- Restart coc
vim.api.nvim_set_keymap('n', '<leader>cr', ':CocRestart<cr>', {noremap = true, silent = true})
