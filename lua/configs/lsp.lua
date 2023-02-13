local lspconfig = require("lspconfig")

vim.lsp.set_log_level("debug") -- This is necessary for the "nvim-lspconfig" plugin to report proper debug messages

-- FIXME: Doesn't work for now.
-- lspconfig["lua-language-server"].setup({})
lspconfig["lua_ls"].setup({})
