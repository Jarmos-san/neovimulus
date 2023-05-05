-- Module which lazy.nvim automatically uses to manage the Neovim plugins.
-- Its does not need to be manually reloaded nor sourced. See the docs below for more information on this regards:
-- https://github.com/folke/lazy.nvim#-structuring-your-plugins

local plugins = {
  {
    -- Plugin for deleting & removing buffers without messing up the window layout
    "famiu/bufdelete.nvim",
    event = "BufRead",
  },

  {
    -- Plugin for a better & quicker "Escape" mechanism.
    "max397574/better-escape.nvim",
    event = "InsertLeavePre",
  },

  {
    -- Plugin to enable a smoother scroll animation
    "karb94/neoscroll.nvim",
    event = "BufRead",
    opts = {
      -- Respect the scrolloff marging (see ":h scrolloff" for more info)
      respect_scrolloff = true,
      -- Stop the cursor from scrolling further if the window cannot scroll any more.
      cursor_scrolls_alone = false,
    },
  },

  {
    -- Functionally better plugin for showing a nice colorcolum
    "m4xshen/smartcolumn.nvim",
    event = "BufRead",
    opts = require("configs.smartcolumn").options,
  },

  {
    -- A better functioning & minimal terminal for usage within Neovim itself
    "rebelot/terminal.nvim",
    cmd = { "TermOpen", "TermRun" },
    init = require("configs.terminal").init,
    config = require("configs.terminal").config,
  },

  {
    -- A UI plugin for registering and managing keymaps under a single place
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = require("configs.which-key").init,
    config = require("configs.which-key").config,
  },

  {
    -- Plugin to display the diagnostic messages in a floating window
    "folke/trouble.nvim",
    event = "LspAttach",
    cmd = "Trouble",
    config = true,
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  {
    -- Plugin to easily search for files using fuzzy-search & more behaviour like one would find
    -- one other GUI Text Editors like VSCode & so on
    "nvim-telescope/telescope.nvim",
    event = "BufRead",
    cmd = "Telescope",
    opts = {
      file_ignore_patterns = { "%.git", "node_modules", "venv", ".venv", "env", ".env" },
    },
    config = true,
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    -- Plugin for quickly visualising Git VCS info right within the buffer
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = true,
  },

  {
    -- Plugin to showcase the color code based on Hex/RGB/HSL & more
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    ft = { "typescriptreact", "typescript", "javascript", "javascriptreact", "scss", "css", "html" },
  },

  {
    -- Plugin to manage & access the file system using an explorer
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    deactivate = function()
      -- Callback function to deactivate the plugin when necessary.
      vim.cmd([[ Neotree close]])
    end,
    init = require("configs.neo-tree").init,
    opts = require("configs.neo-tree").options,
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    -- Plugin to load JSON schemas
    "b0o/schemastore.nvim",
    event = "BufRead",
    ft = "json",
  },

  {
    -- Plugin which provides some extra keybinds for easier navigation
    "chrisgrieser/nvim-various-textobjs",
    event = "BufRead",
    -- Use the plugin with default keymappings
    opts = { useDefaultKeymaps = true },
    config = true,
  },

  {
    -- Plugin to automatically insert HTML/JSX tags where necessary
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    ft = { "typescriptreact", "javascriptreact", "html" },
  },

  {
    -- Plugin for configuring a nice looking statusline
    "nvim-lualine/lualine.nvim",
    -- This needs to be loaded after the "VeryLazy" event otherwise an ugly
    -- unstyled statusline is created after Neovim startup
    event = "VeryLazy",
    config = require("configs.lualine").config,
  },

  {
    -- The default colorscheme used right now
    "navarasu/onedark.nvim",
    event = "VimEnter",
    opts = {
      style = "darker",
      transparent = true,
      lualine = { transparent = true },
    },
  },

  {
    -- Plugin for better (un)commenting of code
    "echasnovski/mini.comment",
    event = { "BufNewFile", "BufRead" },
    opts = {
      -- Ensure blanklines don't have unnecessary comments to avoid clutter
      ignore_blank_lines = true,
      hooks = {
        pre = function()
          -- Necessary hook for commenting source code based on Treesitter queries.
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(opts)
      require("mini.comment").setup(opts)
    end,
  },

  {
    -- Simple & minimal plugin for pairing brackets, quotes & more!
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {
      modes = {
        insert = true, -- "Insert" mode
        command = true, -- "Command" mode
        terminal = true, -- "Terminal" mode
      },
    },
    config = function(opts)
      require("mini.pairs").setup(opts)
    end,
  },

  {
    -- Plugin for easier insertion of pairs like quotations & more
    "echasnovski/mini.surround",
    event = "BufRead",
    config = function()
      require("mini.surround").setup()
    end,
  },

  {
    -- Plugin to visualise indentation of source code in a better way
    "echasnovski/mini.indentscope",
    event = "BufRead",
    config = function()
      require("mini.indentscope").setup()
    end,
  },

  {
    -- Plugin to load a nice dashboard with utilities in the startup screen
    "goolord/alpha-nvim",
    event = "VimEnter",
    init = require("configs.alpha").init,
    config = require("configs.alpha").config,
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  {
    -- A friendly plugin for managing the LSP servers more easily.
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = require("configs.mason").config,
    config = true,
    dependencies = "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  {
    -- Extension for "mason.nvim" which makes it VERY easy to auto-install LSP servers.
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    init = require("configs.mason").init,
    config = require("configs.mason").tools,
  },

  {
    -- Plugin for using the builtin LSP client to hook into other non-LSP tools like Prettier & ESLint.
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = require("configs.null-ls").config,
  },

  {
    -- UI plugin for showing notifications appropriately instead of taking up the message space
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    init = require("configs.notify").init,
    config = require("configs.notify").config,
  },

  {
    -- Official plugin for more ease in configuring the in-built LSP client.
    "neovim/nvim-lspconfig",
    event = "LspAttach",
    init = require("configs.lsp").init,
    config = require("configs.lsp").config,
    dependencies = {
      -- This plugin needs to be loaded as well otherwise Neovim can't find the LSP binary on $PATH.
      "williamboman/mason.nvim",
    },
  },

  {
    -- Plugin for VSCode-like snippets powered by Neovim's in-built LSP.
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "rafamadriz/friendly-snippets",
    },
  },

  {
    -- Extra plugin for a more VSCode-like snippets behaviour.
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  },

  {
    -- Better autocompletion support for Neovim.
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = require("configs.cmp").config,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
    },
  },
}

return plugins
