return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "[a", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" }
      keys[#keys + 1] = { "]a", vim.diagnostic.goto_next, desc = "Go to next diagnostic" }
      keys[#keys + 1] = { "<leader>a", vim.diagnostic.open_float, desc = "Open diagnostic" }
    end,
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {},
  },
}
