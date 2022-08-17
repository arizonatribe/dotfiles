local uv = vim.loop
local util = require "lspconfig.util"

local function get_node_modules(root_dir)
    -- util.find_node_modules_ancestor()
    local root_node = root_dir .. "/node_modules"
    local stats = uv.fs_stat(root_node)
    if stats == nil then
        return nil
    else
        return root_node
    end
end

local default_node_modules = get_node_modules(vim.fn.getcwd())

local ngls_cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    default_node_modules,
    "--ngProbeLocations",
    default_node_modules,
    "--includeCompletionsWithSnippetText",
    "--includeAutomaticOptionalChainCompletions",
    -- "--logToConsole",
    -- "--logFile",
    -- "/Users/nunezd/logs.txt"

}

local M = {}

M.setup = function(on_attach, capabilities)
    require("lspconfig").angularls.setup({
        cmd = ngls_cmd,
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = util.root_pattern("angular.json"),
        on_new_config = function(new_config)
            new_config.cmd = ngls_cmd
        end
    })
end

return M
