local u = require("config.utils")

local illuminate = require("illuminate")

u.nmap("<M-n>", function()
    illuminate.next_reference({ wrap = true })
end)
u.nmap("<M-p>", function()
    illuminate.next_reference({ reverse = true, wrap = true })
end)

-- Conflicts with single-letter shortcut to Vim's native "Explore" command
vim.api.nvim_command('au VimEnter delcommand EnableIllumination')
