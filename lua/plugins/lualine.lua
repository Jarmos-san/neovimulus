-- Module for configuring the statusline with the "lualine.nvim" plugin

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "dashboard", "lazy", "alpha" },
        },
      },
    },
  },
}
