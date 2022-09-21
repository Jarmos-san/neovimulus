--[[
Module for configuring the builti-in LSP client.
--]]

local M = {}

function M.config()
    local on_attach = function() end

    local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
                    library = vim.api.nvim_get_runtime_file("", true)
                },
                telemetry = {
                    -- Disable telemetry for privacy concerns.
                    enable = false
                },
            },
        },
    })
end

return M
