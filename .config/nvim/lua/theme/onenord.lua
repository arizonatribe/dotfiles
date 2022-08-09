require('onenord').setup({
  theme = "dark", -- "dark" or "light"
  borders = true, -- Split window borders
  fade_nc = true, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  -- styles = {
  --   comments = "NONE",
  --   strings = "NONE",
  --   keywords = "NONE",
  --   functions = "NONE",
  --   variables = "NONE",
  --   diagnostics = "underline",
  -- },
  disable = {
    background = true, -- When true, allows transparency to work (if it was set elsewher). When false, uses the theme default background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
})
