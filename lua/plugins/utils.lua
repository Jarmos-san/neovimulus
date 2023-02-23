return {
  {
    "famiu/bufdelete.nvim", -- Plugin for deleting & removing buffers without messing up the window layout
  },

  {
    "echasnovski/mini.comment", -- Plugin for easier commenting across source code
    event = "VeryLazy", -- Not sure what this event is about but it works any way!
    opts = {
      hooks = {
        pre = function()
          -- Necessary hook for commenting source code based on Treesitter queries.
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      -- Initialise the plugin for usage across buffers.
      require("mini.comment").setup(opts)
    end,
  },

  {
    "max397574/better-escape.nvim", -- Plugin for a better & quicker "Escape" mechanism.
    event = "BufReadPost", -- Load the plugin only when leaving Insert mode.
    config = true, -- Load & initialise the plugin
  },

  {
    "karb94/neoscroll.nvim", -- Plugin for smooth scrolling across a buffer.
    event = "BufReadPost", -- Load plugin only after the contents of the buffer are read
    config = true, -- Initialise the plugin with default values
  },

  {
    "m4xshen/smartcolumn.nvim", -- Functionally better plugin for showing a nice colorcolum
    event = "FileType", -- Load the plugin only when the filetype of the buffer is recognised.
    opts = {
      -- Disable the colorcolum in certain filetypes like Vim help files.
      disabled_filetypes = { "help", "text", "markdown", "alpha", "checkhealth" },
      custom_colorcolumn = { lua = 120 }, -- Configure the character length at which to show the colorcolumn.
    },
  },

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
    "akinsho/toggleterm.nvim", -- Plugin for a highly customisable terminal right inside Neovim
    config = true, -- Initialise the plugin with default values
    cmd = { "ToggleTerm" }, -- Load the plugin only when this command is invoked
  },

  {
    "windwp/nvim-autopairs", -- Plugin for automatically inserting bracket pairs
    event = "InsertEnter", -- Load the plugin only when entering Insert mode.
    config = true, -- Setup the plugin to be initialised & work as expected.
  },

  {
    "chrisgrieser/nvim-various-textobjs", -- Plugin which provides some extra keybinds for easier navigation
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true }) -- use plugin provided default inbuilt keymaps
    end,
  },

  {
    "roobert/search-replace.nvim",
    config = function()
      require("search-replace").setup({
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
  },
}
