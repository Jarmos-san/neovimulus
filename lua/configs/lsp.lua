local lspconfig = require("lspconfig")
-- FIXME: Figure out why is it even necessary here.
-- local notify = require("notify") -- Make Neovim use the prettier UI plugin

vim.opt.updatetime = 250 -- Make Neovim to display the diagnostic hover window as fast as possible.
vim.lsp.set_log_level("debug") -- This is necessary for the "nvim-lspconfig" plugin to report proper debug messages
vim.diagnostic.config({
  virtual_text = false, -- Disable the inline diagnostic message
  underline = true, -- Show diagnostic errors with a squigly underline
  signs = false, -- Disable the diagnostic signs in the number column to keep the UI clean
  update_in_insert = true, -- Update the diagnostic message even when in Insert mode
  severity_sort = true, -- Configure Neovim to sort the error messages according to the severity.
})

-- Add rounded borders to the LSP flaoting windows
require("lspconfig.ui.windows").default_options.border = "rounded"

local on_attach = function(_, bufnr)
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  map("n", "<Leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folder))
  end, opts)
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "gr", vim.lsp.buf.references, opts)

  -- Configurations for showing diagnostics in a hover window instead. See the documentations at:
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local hover_window_configs = {
        -- This needs to be false else the cursor swtiches to the diagnostic window.
        -- See this discussion thread for more information on this concern:
        -- https://neovim.discourse.group/t/cursor-switching-floating-window-diagnostic-on-movement/1471/2?u=jarmos-san
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }

      vim.diagnostic.open_float(nil, hover_window_configs)
    end,
  })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- INFO: Necessary configuration for the JSON LSP server. See the following URL for more information:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP configurations for Lua files
lspconfig["lua_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" }, -- Set the Neovim's embedded Lua runtime for the LSP to recognise
      -- Disable the LSP provided diagnostics since it shows false-negatives & interferes with Selene
      diagnostics = { enable = false },
      -- Configure the LSP to know where & how to look for the Neovim runtime files
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false }, -- Disable telemetry for privacy concerns
    },
  },
})

-- LSP configurations for JSON files
lspconfig["jsonls"].setup({
  on_attach = on_attach,
  capabilties = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(), -- Load the JSON schemas
      -- See this issue thread for more information on this needs to be enabled.
      -- https://github.com/b0o/SchemaStore.nvim/issues/8
      validate = { enable = true },
    },
  },
})

-- LSP configurations for YAML files
lspconfig["yamlls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = { ["https://json.schemastore.org/github-action.json"] = ".github/workflows/*" },
    },
  },
})
