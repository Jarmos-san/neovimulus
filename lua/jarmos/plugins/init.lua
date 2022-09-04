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

		-- Install plugin for configuring the LSP client.
		use({
			"neovim/nvim-lspconfig",
			config = function()
				local on_attach = function(_, bufnr)
					vim.api.nvim_buf_set_option(
						bufnr,
						"omnifunc",
						"v:lua.vim.lsp.omnifunc"
					)
				end
				require("lspconfig").sumneko_lua.setup({
					on_attach = on_attach,
					settings = {
						Lua = {
							runtime = {
								-- The version of Lua used by Neovim.
								version = "LuaJIT",
							},
							diagnostics = {
								-- Let the Lua LSP server be aware of the "vim" namespace.
								globals = { "vim" },
							},
							workspace = {
								-- Make the Lua LSP server be aware of the Neovim runtime files.
								library = vim.api.nvim_get_runtime_file(
									"",
									true
								),
							},
							telemetry = {
								-- Disable data tracking for privacy concerns.
								enable = false,
							},
						},
					},
				})
			end,
		})

		-- Plugin for installing the various LSP servers.
		use({
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({
					log_level = vim.log.levels.DEBUG,
				})
			end,
		})

		use({
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = function()
				require("mason-tool-installer").setup({
					ensure_installed = {
						"lua-language-server",
						"stylua",
						"selene",
						-- FIX: https://github.com/williamboman/mason.nvim/issues/364
						-- "editorconfig-checker",
					},
				})
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
