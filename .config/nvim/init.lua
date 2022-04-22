local lfs = require("lfs")

local home = os.getenv("HOME")
local homevim = home + "/.local/share/nvim/"
local myvimrc = home + "/.config/nvim/init.vim"
local dirsite = homevim + "site"
local dirplugins = homevim + "plugged"
local dirautoload = dirsite + "/autoload"
local autoload_plug_file = dirautoload + "/plug.vim"
local dircolors = homevim + "colors"
local dirbackup = homevim + "backup"
local dirundo = homevim + "undo"
local dirswap = homevim + "swap"

function isdirectory(path)
  if (lfs.attributes(path, "mode") == "directory") then
    return true
  end
  return false
end

function isfile(path)
  if (lfs.attributes(path, "mode") == "file") then
    return true
  end
  return false
end

if !isdirectory(homevim) then
    lfs.mkdir(homevim)
end
if !isdirectory(dirplugins) then
    lfs.mkdir(dirplugins)
end
if !isdirectory(dirsite) then
    lfs.mkdir(dirsite)
end
if !isdirectory(dirautoload) then
    lfs.mkdir(dirautoload)
end
if !isdirectory(dircolors) then
    if isdirectory(dirplugins . "/vim-colorschemes") then
        lfs.mkdir(dircolors)
        os.execute("cp " + dirplugins + "/vim-colorschemes/colors/* " + dircolors)
    end
end

if !isdirectory(dirbackup) then
    lfs.mkdir(dirbackup)
end
if !isdirectory(dirundo) then
    lfs.mkdir(dirundo)
end
if !isdirectory(dirswap) then
    lfs.mkdir(dirswap)
end

-- source core config files
require("core")
require("colors")
require("mappings")
require("plugins")
