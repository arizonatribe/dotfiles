local M = {}

local cmd = vim.cmd
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
cmd([[let g:terraform_fmt_on_save=1]])
cmd([[let g:terraform_align=1]])

keymap("n", "<leader>ti", ":!terraform init<CR>", opts)
keymap("n", "<leader>tv", ":!terraform validate<CR>", opts)
keymap("n", "<leader>tp", ":!terraform plan<CR>", opts)
keymap("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", opts)

M.setup = function(on_attach, capabilities)
    require("lspconfig").terraformls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
