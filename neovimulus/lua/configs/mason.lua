-- Module for configuring the "mason.nvim" plugin

local M = {}

local mason_packages = {
  "bash-language-server",
  "json-lsp",
  "lua-language-server",
  "shellcheck",
  "shfmt",
  "stylua",
}

M.init = function()
  local autocmd = vim.api.nvim_create_autocmd
  local augroup = function(name)
    return vim.api.nvim_create_augroup("augroup" .. name, { clear = true })
  end

  autocmd("User", {
    pattern = "MasonToolsUpdateComplete",
    desc = "Invoke a notification when Mason has completed installing/updating the servers",
    group = augroup("mason_notifications"),
    callback = function()
      vim.schedule(function()
        vim.notify("Mason has completed installing the servers...")
      end)
    end,
  })
end

M.tools = function()
  require("mason-tool-installer").setup({
    ensure_installed = mason_packages,
  })
end

M.config = {
  -- Configure the plugin to have rounded borders
  ui = { border = "rounded" },
  -- Configure the log levels for the plugin
  log_level = vim.log.levels.WARN,
}

return M
