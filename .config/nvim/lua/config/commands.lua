local u = require("config.utils")
local api = vim.api

-- make global to make ex commands easier
_G.inspect = function(...)
    print(vim.inspect(...))
end

-- lazy macOS dark mode
api.nvim_create_user_command("CheckBackground", function()
    local mode = vim.trim(u.get_system_output("defaults read -g AppleInterfaceStyle")[1])
    local background = mode == "Dark" and "dark" or "light"
    api.nvim_set_option("background", background)
end, {})

api.nvim_create_autocmd("ColorSchemePre", {
    command = "CheckBackground",
})

-- reset treesitter and lsp diagnostics
u.command("R", "w | :e")
