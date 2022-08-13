-- Switches to right splitting
vim.g.netrw_altv = 1
-- Opens a file in the previous window (instead of the same window)
vim.g.netrw_browse_split = 4
-- Tree style listing of directories
vim.g.netrw_liststyle = 3
-- Disables the banner
vim.g.netrw_banner = 0
-- Hides files/folders from the file explorer based on a local .gitignore file
-- vim.g.netrw_list_hide=netrw_gitignore#Hide()
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]]
