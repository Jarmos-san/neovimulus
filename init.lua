--[
-- =================================================================================
-- This is the main initialisation file which Neovim invokes during startup.
-- All the other modular Lua files available under the "~/.config/nvim/lua"
-- directory are imported in to this single initialisation file.
-- =================================================================================
--]

require("settings")
require("keymaps")
require("autocommands")
require("plugins")
