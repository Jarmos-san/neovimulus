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
				require("user.plugins.onedark").config()
			end,
		})

        -- Install a bunch of plugins for better auto-completion & snippet support.
        use({
            "hrsh7th/nvim-cmp",
            config = function()
                local cmp = require("cmp")

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true}),
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                    }),
                })

            end,
            requires = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-cmdline" },
            },
        })

        -- Neccessary plugin for snippet support.
        use({
            "L3MON4D3/LuaSnip",
            requires = {
                { "saadparwaiz1/cmp_luasnip" },
            },
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

		use({
			-- Plugin for installing the various LSP servers.
			"williamboman/mason.nvim",
			config = function()
				require("user.plugins.mason").config()
			end,
		})

		use({
			-- Plugin for auto-installing necessary tools like LSP servers,
			-- formatters, linters & so on.
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = function()
				require("user.plugins.mason").install_servers()
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
