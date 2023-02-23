return {
  {
    -- A pretty colorscheme inspired from the now defunct Atom editor.
    "navarasu/onedark.nvim",
    event = "UIEnter", -- Load the colorscheme immediately after startup to avoid unexpected behaviours.
    config = function() -- Configuration for the colorscheme.
      require("configs.colorscheme")
    end,
  },

  {
    -- Official plugin for more ease in configuring the in-built LSP client.
    "neovim/nvim-lspconfig",
    -- event = "BufReadPost", -- Lazy-load the plugin only after the Neovim UI is loaded.
    config = function() -- Configurations for the many LSP servers used within Neovim.
      require("configs.lsp")
    end,
    dependencies = {
      -- This plugin needs to be loaded as well otherwise Neovim can't find the LSP binary on $PATH.
      "williamboman/mason.nvim",
    },
  },

  {
    -- Plugin for VSCode-like snippets powered by Neovim's in-built LSP.
    "L3MON4D3/LuaSnip",
    event = "InsertEnter", -- Lazy-load the plugin only when the buffer is in Insert mode.
    dependencies = { -- Load these dependencies when the snippet plugin is used.
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "rafamadriz/friendly-snippets",
    },
  },

  {
    -- Extra plugin for a more VSCode-like snippets behaviour.
    "rafamadriz/friendly-snippets",
    events = "InsertEnter", -- Lazy-load the plugin only when the buffer is in an Insert mode.
  },

  {
    -- Better autocompletion support for Neovim.
    "hrsh7th/nvim-cmp",
    dependencies = { -- A bunch of extra extensions for the autocompletions plugin.
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() -- Configuration module for the autocompletion module.
      require("configs.cmp")
    end,
    event = "InsertEnter", -- Lazy-load the plugin only when the buffer is in Insert mode.
  },

  {
    -- A friendly plugin for managing the LSP servers more easily.
    "williamboman/mason.nvim",
    config = function() -- Configuration module for the plugin.
      require("configs.mason")
    end,
    cmd = "Mason", -- Lazy-load the plugin only when this command is invoked.
    -- Load this dependency when the plugin is loaded as well.
    dependencies = "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  {
    -- Extension for "mason.nvim" which makes it VERY easy to auto-install LSP servers.
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      -- TODO: Figure a way out to move these contents to the "mason.lua" module.
      require("mason-tool-installer").setup({
        -- Ensure the following LSP servers are always installed & made available on $PATH.
        ensure_installed = { "lua-language-server", "stylua", "selene", "shfmt", "shellcheck" },
        auto_update = true, -- Ensure the installed LSP servers are always up-to-date.
      })
    end,
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" }, -- Lazy-load the extension only when these commands are invoked.
  },

  {
    -- Plugin for using the builtin LSP client to hook into other non-LSP tools like Prettier & ESLint.
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPost", -- Load the plugin only when the buffer is read & filetype is known.
    dependencies = { -- Load some necessary dependencies for the plugin.
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function() -- Configuration module for the plugin.
      require("configs.null-ls")
    end,
  },

  {
    "rcarriga/nvim-notify", -- A plugin which makes the Neovim UI prettier & more modern.
    config = true,
  },

  {
    "folke/trouble.nvim",
    config = true,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    cmd = { "Trouble" },
  },

  {
    "folke/noice.nvim",
    config = true,
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },
}
