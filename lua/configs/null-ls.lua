local null_ls = require("null-ls")

null_ls.setup({
  border = "rounded", -- Enable a nice-looking UI for the plugin's floating window
  on_attach = function(client, bufnr) -- Functionality for the LSP when it attaches to the buffer
    -- Check if the server supports LSP-based formatting
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("formatter_group", { clear = true }),
        buffer = bufnr,
        callback = function()
          -- Enable the builtin formatting capabilities of Neovim to use the plugin
          vim.lsp.buf.format({
            timeout_ms = 6000, -- Don't take longer than 6secs to format a buffer
            bufnr = bufnr,
            filter = function()
              -- Only use the plugin's capabilities to format the contents of the buffer
              return client.name == "null-ls"
            end,
          })
        end,
      })
    end
  end,
  sources = {
    null_ls.builtins.formatting.stylua.with({ -- Formatter for Lua files
      extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    }),
    null_ls.builtins.diagnostics.selene.with({ -- Linter for Lua files
      condition = function(utils) -- Only enable the linter if its configuration files exists
        return utils.root_has_file({ "selene.toml", "vim.toml" })
      end,
    }),
  },
})
