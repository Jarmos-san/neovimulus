-- Path to install "lazy.nvim" at
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Small snippet to install "lazy.nvim" from within Neovim.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Update the Neovim runtimepath for "lazy.nvim" to source the plugins.
vim.opt.rtp:prepend(lazypath)

-- Map the <Leader> key to <Space>.
vim.g.mapleader = " "

-- Some necessary Neovim options to make it work better for me.
vim.opt.number = true -- Enable the current row number of the left side.
vim.opt.relativenumber = true -- Enable the number column on the left.
vim.opt.hlsearch = false -- Disable highlighting the searched keyword.
vim.opt.ignorecase = true -- Disable searching for case-specific keywords.
vim.opt.smartcase = true -- Intelligently figure out case-senstivity when looking up keywords.
vim.opt.scrolloff = 10 -- Maintain a buffer of 10 rows when scroll up/down.
vim.opt.autoindent = true -- Copy indent from the current line when starting a newline.
vim.opt.smartindent = true -- Make the indents smarter based on the "autoindents".
vim.opt.winblend = 0 -- Controls the transparency of the floating windows. Values range from 0-100.
vim.opt.wildoptions = "pum" -- Display the popup-menu for completions.
vim.opt.pumblend = 5 -- Controls the transparency of the popup-menu which appears during completions.
vim.opt.backup = false -- Disable creating backups before modifying a file.
vim.opt.showcmd = true -- Enable showcasing the current invoked command.
vim.opt.cmdheight = 1 -- Not sure what it does or how it helps. (lol?)
-- There's too much I don't understand about configuring Tab/Space indents in Neovim.
-- See the following SO thread for a detailed explanation:
-- https://stackoverflow.com/a/1878983/8604951
vim.opt.tabstop = 4 -- Insert 4 Spaces when a single Tab is pressed.
vim.opt.softtabstop = 0 -- Magic!!
vim.opt.shiftwidth = 4 -- More magic!!
vim.opt.expandtab = true -- Insert appropriate number of Spaces when a <Tab> is pressed.
vim.opt.smarttab = true -- Insert Spaces when a <Tab> is pressed.
vim.opt.breakindent = true -- Wrap every line with proper indents.
vim.opt.backspace = { "start", "eol", "indent" } -- Perform appropriate actions when <Backspace> is pressed.

-- Setup some bare minimum necessary keybindings to work with Neovim properly.
local map = vim.keymap.set
local opts = { silent = true }

map("i", "jk", "<Esc>") -- Press "jk" in quick succession to exit Insert mode.

-- Install the necessary plugins through "lazy.nvim"
require("lazy").setup({
  {
    "navarasu/onedark.nvim", -- A pretty colour scheme based on the now defunct Atom editor.
    event = "UIEnter",
    config = function() -- Load the colorscheme in Neovim.
      local onedark = require("onedark")

      -- Configure the colorscheme
      onedark.setup({
        style = "darker"
      })

      -- Load the colorscheme.
      onedark.load()
    end,
  },

  {
    -- TODO: Make this plugin work properly.
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function() end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "comment" },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
        folding = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1000,
        },
        autotag = {
          enable = true,
        },
      })
    end,
  },

  {
    "numToStr/Comment.nvim", -- Plugin for better & easier commenting code.
    config = function() -- Configuring the plugin for commenting source code based on Treesitter.
        -- FIXME: Doesn't work for now.
        -- local commentstring_integration = require("ts_context_commentstring.integrations.comment_nvim")

        -- require("Comment").setup({
        --    pre_hook = commentstring_integrations.create_pre_hook()
        -- })
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim", -- Plugin for file explorer capabilities.
    -- FIXME: Doesn't lazy-load right now for whatever reason.
    -- cmd = "NeoTree", -- Lazy-load the plugin when this command is invoked.
    config = function()
      require("neotree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        window = { position = "left", width = "25" },
        filesystem = { hijack_netrw_behavior = "open_current", }
      })
    end, -- Configuration for the file-explorer plugin.
    dependencies = { -- Dependencies of the plugin for icon support, async capabilities & a better UI.
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim", -- Plugin for visualising the indent columns.
    event = "UIEnter", -- Lazy-load the plugin since its required only after startup.
  },

  {
    "lewis6991/gitsigns.nvim", -- Plugin for better Git VCS capabilities right within Neovim.
    cond = function()
      -- TODO: Configure the plugin to load only when the project is a local Git repository.
    end
  },

  {
    "nvim-lualine/lualine.nvim", -- Plugin for a good-looking Neovim statusline.
    event = "UIEnter", -- Lazy-load the plugin only when the UI is visible to the user.
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- Extra plugin for pretty icons to work on the statusline.
    },
    config = function() -- Configuration for the statusline plugin.
      local lualine = require("lualine")

      lualine.setup({
        options = { theme = "onedark" }, -- Load the "onedark" colorscheme for the statusline.
        disabled_filetypes = { "filesystem" }, -- Disable the statusline for certain filetypes.
      })
    end,
  },
})
