local u = require("config.utils")

vim.g.javascript_plugin_jsdoc = 1
vim.g.jsdoc_allow_input_prompt = 1

u.command("JsDog", "jsdoc#insert()")
