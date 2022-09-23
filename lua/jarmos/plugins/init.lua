local status, packer = pcall(require, "packer")

if not status then
	print("Packer not installed!")
	return
end

vim.cmd([[ packadd packer.nvim ]])

packer.startup({
	function(use)
		use({
			-- Allow "packer.nvim" to keep itself updated!
			"wbthomason/packer.nvim",
		})

		use({
			-- Install a good-looking colorscheme to make it easier to work with.
			"navarasu/onedark.nvim",
			config = function()
				require("jarmos.plugins.onedark").config()
			end,
		})

		-- Install a bunch of plugins for better auto-completion & snippet support.
		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("jarmos.plugins.lsp").setup_completions()
			end,
			requires = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			},
			after = "nvim-lspconfig",
		})

		-- Neccessary plugin for snippet support.
		use({
			"L3MON4D3/LuaSnip",
			after = "nvim-cmp",
		})

		-- Install plugin for configuring the LSP client.
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("jarmos.plugins.lsp").setup_lsp()
			end,
		})

		use({
			-- Plugin for installing the various LSP servers.
			"williamboman/mason.nvim",
			config = function()
				require("jarmos.plugins.mason").config()
			end,
		})

		use({
			-- Plugin for auto-installing necessary tools like LSP servers,
			-- formatters, linters & so on.
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = function()
				require("jarmos.plugins.mason").install_servers()
			end,
		})

		-- FIXME: Configure the Docker container with a C compiler for the plugin to work properly.
		-- use({
		--   "nvim-treesitter/nvim-treesitter",
		--     run = function()
		--       require("nvim-treesitter.install").update({
		--         with_sync = true,
		--       })
		--     end,
		--     config = function()
		--       require("nvim-treesitter.configs").setup({
		--         ensure_installed = { "lua" },
		--         highlight = {
		--           enable = true,
		--         },
		--         incremental_selection = {
		--           enable = false,
		--         },
		--         indent = {
		--           enable = false,
		--         },
		--         folding = {
		--           enable = false,
		--         },
		--      })
		--    end,
		--  })
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
