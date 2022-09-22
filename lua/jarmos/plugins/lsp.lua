--[[
Module for configuring the builti-in LSP client.
--]]

local M = {}

function M.setup_lsp()
	local on_attach = function()
		-- TODO: Add the LSP-based keymaps over here.
	end

	local capabilities = require("cmp_nvim_lsp").update_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	)

	require("lspconfig").sumneko_lua.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					-- Set the correction version of the embedded Lua environment.
					version = "LuaJIT",
				},
				diagnostics = {
					-- configure the LSP server to understand the "vim" namespace.
					globals = { "vim" },
				},
				workspace = {
					-- configure the LSP server to understand where to look for Neovim runtime files.
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					-- Disable telemetry for privacy concerns.
					enable = false,
				},
			},
		},
	})
end

function M.setup_completions()
	local cmp = require("cmp")

	local lspkind_icons = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
	}

	cmp.setup({
		-- INFO: Disable the autocompletion popup menu when typing comments.
		enabled = function()
			local context = require("cmp.config.context")
			if vim.api.nvim_get_mode().mode == "c" then
				return true
			else
				return not context.in_treesitter_capture("comment")
					and not context.in_syntax_group("Comment")
			end
		end,
		-- INFO: Make the completion menu more informative & good-looking.
		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = string.format(
					"%s %s",
					lspkind_icons[vim_item.kind],
					vim_item.kind
				)
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[Snippet]",
					nvim_lua = "[Neovim]",
				})[entry.source.name]
				return vim_item
			end,
		},
		-- INFO: Enable snippet support within the automcompletion popup menu.
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
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
		}),
	})
end

return M
