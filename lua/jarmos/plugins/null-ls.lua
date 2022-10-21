--[[
Module for configuring the "null-ls" plugin.
--]]

local M = {}

function M.config()
	local null_ls = require("null-ls")
	local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({
					group = lsp_format_augroup,
					buffer = bufnr,
				})
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = lsp_format_augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							bufnr = bufnr,
							filter = function(client)
								return client.name == "null-ls"
							end,
						})
					end,
				})
			end
		end,
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.diagnostics.selene,
		},
	})
end

return M
