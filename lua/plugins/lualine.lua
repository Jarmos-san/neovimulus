-- Module for configuring the statusline with the "lualine.nvim" plugin

return {
  {
    "nvim-lualine/lualine.nvim", -- Plugin for configuring a nice looking statusline
    event = "VeryLazy", -- Load the plugin when Lazy wants it to
    config = function()
      require("lualine").setup({
        options = {
          -- Leaving an empty table renders the square-edged components, else the default angled ones are loaded
          section_separators = {},
          component_separator = "|",
          theme = "codedark", -- Set the theme
          globalstatus = true,
          disabled_filetypes = { -- Disable the statusline for certain filetypes mentioned below
            statusline = { "filesytem", "neo-tree", "dashboard", "lazy", "alpha" },
          },
        },
        sections = {
          -- Statusline components to showcase on the right-most end
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
