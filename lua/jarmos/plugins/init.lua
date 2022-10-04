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
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp-signature-help",
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

        -- Plugin for better syntax highlighting & among other goodies!
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({
					with_sync = true,
				})
			end,
			config = function()
				require("jarmos.plugins.treesitter").setup()
			end,
            requires = {
                -- Necessary plugin for proper commenting in JSX/TSX files.
                "JoosepAlviste/nvim-ts-context-commentstring",
                -- Treesitter-based plugin for colourising brackets.
                "p00f/nvim-ts-rainbow",
                -- Treesitter-based plugin for automatically inserting/renaming HTML tags.
                "windwp/nvim-ts-autotag",
            },
		})

        -- Plugin for easier commenting around the source code based on Treesitter parsing.
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("jarmos.plugins.comment").config()
            end
        })

        -- Treesitter-based plugin for automatic brackets insertion.
        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({
                    check_ts = true,
                })
            end
        })

        -- A more modern file explorer for Neovim which is based on Lua.
        use({
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
                "MunifTanjim/nui.nvim"
            },
            config = function()
                require("jarmos.plugins.neotree").config()
            end
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
