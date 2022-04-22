vim.g.javascript_plugin_jsdoc = 1
vim.g.jsdoc_allow_input_prompt = 1

vim.api.nvim_create_user_command("JSDoc", {
    command = "jsdoc#insert()"
    bang = true
})
vim.api.nvim_create_user_command("JsDoc", {
    command = "jsdoc#insert()"
    bang = true
})
