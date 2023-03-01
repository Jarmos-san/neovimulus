-- Module for configuring some utilitarian plugins

return {
  { "famiu/bufdelete.nvim" }, -- Plugin for deleting & removing buffers without messing up the window layout

  { "max397574/better-escape.nvim", event = "BufReadPost" }, -- Plugin for a better & quicker "Escape" mechanism.

  {
    "karb94/neoscroll.nvim", -- Plugin to enable a smoother scroll animation
    event = "BufReadPost", -- Load the plugin only after the contents of the buffer are read
    config = function()
      require("neoscroll").setup() -- Initialising the plugin with default configs is necessary for it work everytime
    end,
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
  },

  { "b0o/schemastore.nvim", ft = "json" }, -- Plugin to load JSON schemas

  {
    "akinsho/toggleterm.nvim", -- Plugin for a better more accessible terminal
    event = { "BufReadPost" }, -- Load the plugin after the contents of the buffer are read
    config = true, -- Initialise the plugin with default values
  },

  {
    "chrisgrieser/nvim-various-textobjs", -- Plugin which provides some extra keybinds for easier navigation
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true }) -- use plugin provided default inbuilt keymaps
    end,
  },
}
