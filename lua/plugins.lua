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
    -- Plugin for more easily commenting out blocks of code.
    "numToStr/Comment.nvim",
    event = "BufReadPost", -- Load the plugin only after the buffer is read.
    config = true, -- Setup the plugin for it to be initialised & work.
  },

  {
    -- Plugin for automatically inserting bracket pairs & much more.
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Load the plugin only when entering Insert mode.
    config = true, -- Setup the plugin to be initialised & work as expected.
  },

  {
    -- Plugin for properly visualising the indent lines & much more.
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost", -- Load the plugin only the buffer is read.
    config = function()
      require("configs.indent-blankline") -- Configuration module for the plugin.
    end,
  },

  -- {
  --     "famiu/bufdelete.nvim",
  --     disable = true, -- FIXME: Doesn't work for now.
  --     cmd = "BDelete",
  --     config = function()
  --         require("bufdelete").bufdelete(0, true)
  --     end,
  -- },

  -- {
  --     "folke/which-key.nvim", -- Plugin for easier maintainance of keybindings.
  --     event = "BufReadPost", -- Load the plugin only after the contents of the buffer is read.
  --     config = function()
  --         require("configs.which-key") -- Configuraiont module for the plugin.
  --     end,
  -- },

  {
    "norcalli/nvim-colorizer.lua", -- Plugin to display the colours of their respective hex codes.
    ft = { "scss", "css", "javascript", "typescriptreact", "html" }, -- Specific filetypes to load this plugin for.
    config = true, -- Initializes the plugin for usage within Neovim.
  },

  {
    "b0o/schemastore.nvim", -- Plugin to load JSON schemas.
    ft = "json", -- Load the plugin only for JSON files.
  },

  {
    "karb94/neoscroll.nvim", -- Plugin for smooth scrolling across a buffer.
    event = "BufReadPost", -- Load plugin only after the contents of the buffer are read
    config = true, -- Initialise the plugin for usage within Neovim.
  },

  {
    "roobert/search-replace.nvim", -- Plugin for search & replace capabilities.
    event = "BufReadPost", -- Load the plugin only after the contents of the buffer are read.
    config = function()
      require("configs.search-replace") -- Configuration module for the plugin.
    end,
  },

  {
    -- Plugin for a better colorcolumn, this replaces the need for using filetype-based plugin config.
    "m4xshen/smartcolumn.nvim",
    event = "FileType", -- Load the plugin only when the filetype of the buffer is recognised.
    config = function()
      require("smartcolumn").setup({
        disabled_filetypes = { "help", "text", "markdown", "alpha" },
        custom_colorcolumn = { lua = 120 }, -- Configure the character length at which to show the colorcolumn.
      })
    end,
  },

  {
    "max397574/better-escape.nvim", -- Plugin for a better & quicker "Escape" mechanism.
    event = "BufReadPost", -- TODO: Figure out an event to load the plugin even later.
    config = true,
  },

  {
    "rcarriga/nvim-notify", -- A plugin which makes the Neovim UI prettier & more modern.
    config = true,
  },

  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = { "ToggleTerm" },
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

  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },
}
