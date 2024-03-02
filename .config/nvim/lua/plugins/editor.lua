return {
  { import = "lazyvim.plugins.extras.editor.mini-files" },

  {
    "folke/flash.nvim",
    vscode = true,
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    cmd = "Neotree",
    opts = {
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git",
          },
          never_show = {
            ".DS_Store",
          },
          always_show = {
            ".env",
          },
        },
      },
      nesting_rules = {
        ["js"] = { "js.map" },
      },
    },
  },
  {
    "noice.nvim",
    opts = {
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
    },
  },
}
