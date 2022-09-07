local home = os.getenv("HOME")
local homevim = home .. "/.local/share/nvim/"
local dirsite = homevim .. "site"
local dirplugins = homevim .. "plugged"
local dirautoload = dirsite .. "/autoload"
local dircolors = home .. "/.config/nvim/colors"
local dirbackup = homevim .. "backup"
local dirundo = homevim .. "undo"
local dirswap = homevim .. "swap"
local packerpath = dirsite .. "/pack/packer/start/packer.nvim"

--- Check if a file or directory exists in this path
function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

--- Check if a directory exists
--- https://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua
function isdirectory(path)
   return exists(path.."/")
end

if not isdirectory(homevim) then
    os.execute("mkdir " .. homevim)
end
if not isdirectory(dirplugins) then
    os.execute("mkdir " .. dirplugins)
end
if not isdirectory(dirsite) then
    os.execute("mkdir " .. dirsite)
end
if not isdirectory(dirautoload) then
    os.execute("mkdir " .. dirautoload)
end
if not isdirectory(dircolors) then
    if isdirectory(dirplugins .. "/vim-colorschemes") then
        os.execute("mkdir " .. dircolors)
        os.execute("cp " .. dirplugins .. "/vim-colorschemes/colors/* " .. dircolors)
    end
end

if not isdirectory(dirbackup) then
    os.execute("mkdir " .. dirbackup)
end
if not isdirectory(dirundo) then
    os.execute("mkdir " .. dirundo)
end
if not isdirectory(dirswap) then
    os.execute("mkdir " .. dirswap)
end
if not exists(packerpath) then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packerpath})
end

-- source core config files
require("colors")
require("config")
require("core")
require("mappings")
require("plugins")
require("theme")
require("lsp")
