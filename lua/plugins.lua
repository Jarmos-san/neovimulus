local status, packer = pcall(require, "packer")

if not status then
	print("Packer not installed!")
	return
end

vim.cmd([[ packadd packer.nvim ]])

packer.startup({
	function(use)
		-- Allow "packer.nvim" to keep itself updated!
		use("wbthomason/packer.nvim")

		-- Install a good-looking colorscheme to make it easier to work with.
		use({
			"navarasu/onedark.nvim",
			config = function()
				require("onedark").setup({
					style = "darker",
				})
				require("onedark").load()
			end,
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
		profile = {
			enable = true,
			threshold = 1,
		},
	},
})
