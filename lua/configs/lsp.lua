local lspconfig = require("lspconfig")
local notify = require("notify") -- Make Neovim use the prettier UI plugin

vim.opt.updatetime = 250 -- Make Neovim to display the diagnostic hover window as fast as possible.
vim.lsp.set_log_level("debug") -- This is necessary for the "nvim-lspconfig" plugin to report proper debug messages
vim.diagnostic.config({
    virtual_text = false, -- Disable the inline diagnostic message
    underline = true, -- Show diagnostic errors with a squigly underline
    signs = false, -- Disable the diagnostic signs in the number column to keep the UI clean
    update_in_insert = true, -- Update the diagnostic message even when in Insert mode
    severity_sort = true, -- Configure Neovim to sort the error messages according to the severity.
})

local on_attach = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, bufnr = bufnr }

    map("n", "gD", vim.lsp.buf.declaration, opts)
    
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local hover_window_configs = {
                focusable = true,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "rounded",
                source = "always",
                prefix = " ",
                scope = "cursor"
            }

            vim.diagnostic.open_float(nil, hover_window_configs)
        end
    })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- INFO: Necessary configuration for the JSON LSP server. See the following URL for more information:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- FIXME: Doesn't work for now.
lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
})

lspconfig["jsonls"].setup({
    on_attach = on_attach,
    capabilties = capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

lspconfig["yamlls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = { ["https://json.schemastore.org/github-action.json"] = ".github/workflows/*" }
        }
    }
})
