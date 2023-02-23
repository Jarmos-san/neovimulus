return {
  {
    "lukas-reineke/indent-blankline.nvim", -- Plugin for easier visualisation of the indents & other blanklines
    event = "BufReadPost", -- Lazy-load the plugin only after the contents ofthe buffer area read
    opts = {
      char = "┊", -- Character to visualise the indents
      space_char_blankline = " ", -- Character to visualise whitespaces (blank in this case)
      show_end_of_line = true, -- Show the end of line character (see :h listchar)
      show_trailing_blankline_indent = true, -- Visualise the trailing characters of a line
      show_current_context = true, -- Show the current context of the indents
    },
    config = function(_, opts)
      require("indent_blankline").setup(opts) -- Initialise the plugin with configurations above
    end,
  },
}
