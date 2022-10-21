--[[
Module for configuring the "null-ls" plugin.
--]]

local M = {}

function M.config()
    local null_ls = require("null-ls")

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.diagnostics.selene,
        }
    })
end

return M
