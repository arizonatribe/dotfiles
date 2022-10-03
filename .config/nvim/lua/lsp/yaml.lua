local M = {}

M.setup = function(on_attach, capabilities)
    require("lspconfig").yamlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            yaml = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
                customTags = {
                    "!Cidr",
                    "!Cidr sequence",
                    "!And",
                    "!And sequence",
                    "!If",
                    "!If sequence",
                    "!Not",
                    "!Not sequence",
                    "!Equals",
                    "!Equals sequence",
                    "!Or",
                    "!Or sequence",
                    "!FindInMap",
                    "!FindInMap sequence",
                    "!Base64",
                    "!Join",
                    "!Join sequence",
                    "!Ref",
                    "!Sub",
                    "!Sub sequence",
                    "!GetAtt",
                    "!GetAZs",
                    "!ImportValue",
                    "!ImportValue sequence",
                    "!Select",
                    "!Select sequence",
                    "!Split",
                    "!Split sequence",
                },
            },
        },
    })
end

return M
