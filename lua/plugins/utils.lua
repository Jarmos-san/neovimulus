-- Module for configuring some utilitarian plugins

return {
  { "famiu/bufdelete.nvim" }, -- Plugin for deleting & removing buffers without messing up the window layout

  { "max397574/better-escape.nvim", event = "BufReadPost" }, -- Plugin for a better & quicker "Escape" mechanism.

  { "karb94/neoscroll.nvim", event = "BufReadPost" }, -- Plugin to enable a smoother scroll animation

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

  { "akinsho/toggleterm.nvim", cmd = { "ToggleTerm" } }, -- Plugin for a better more accessible terminal

  {
    "chrisgrieser/nvim-various-textobjs", -- Plugin which provides some extra keybinds for easier navigation
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true }) -- use plugin provided default inbuilt keymaps
    end,
  },

  {
    -- FIXME: Not sure if it even works!
    "roobert/search-replace.nvim", -- Utilitarian plugin for better & easier search & replace capabilities
    opts = {
      default_replace_single_buffer_options = "gcI",
      default_replace_multi_buffer_options = "egcI",
    },
    config = function(opts)
      require("search-replace").setup(opts)
    end,
  },
}
