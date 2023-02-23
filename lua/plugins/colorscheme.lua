return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    opts = { style = "moon" },
  },

  {
    "catppuccin/nvim",
    name = "catpuccin",
    lazy = true,
  },

  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = true,
    opts = {
      style = "darker",
      transparent = true,
      lualine = { transparent = true },
    },
    events = "VimEnter",
  },

  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = true,
  },
}
