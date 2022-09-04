--[
-- =================================================================================
-- This is the main initialisation file which Neovim invokes during startup.
-- All the other modular Lua files available under the "~/.config/nvim/lua"
-- directory are imported in to this single initialisation file.
-- =================================================================================
--]

require("user.settings")
require("user.keymaps")
require("user.autocommands")
require("user.plugins")
