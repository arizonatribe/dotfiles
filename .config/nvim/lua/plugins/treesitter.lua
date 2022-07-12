require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "fish",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    },
    highlight = {
        enable = true,
        disable = function(_, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 5000
        end,
    },
    -- plugins
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    textsubjects = {
        enable = true,
        keymaps = { ["."] = "textsubjects-smart" },
    },
    autotag = { enable = true },
})
