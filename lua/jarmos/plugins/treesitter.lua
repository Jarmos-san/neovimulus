--[[
Module for configuring the Treesitter plugin in Neovim.
--]]

--[[ TODO: Add a couple more Treesitter-based plugins & configure them. ]]

local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua" },
		highlight = { enable = true },
		incremental_selection = { enable = false },
		indent = { enable = false },
		folding = { enable = false },
	})
end

return M
