-- Module for configuring various UI enhancements to give Neovim a more modern look & feel

return {
  {
    "rcarriga/nvim-notify", -- Plugin for showing nice popup UI, can be used in conjunction with LSP & others
    event = "VimEnter", -- Ensure the plugin is loaded after entering the Neovim UI
    config = function()
      require("notify").setup({
        background_colour = "#262626", -- Set the background colour since the main Neovim background is transparent
        max_width = 60, -- Set the maximum width a notification bar can occupy so as to not clutter the screen too much
        stages = "fade", -- Set the animation to something subtle to avoid distractions
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim", -- Plugin for quickly visualising Git VCS info right within the buffer
    -- Conditionally load this plugin only if the current working directory is a local Git repo
    cond = function()
      if
        not vim.loop.fs_stat(vim.loop.cwd() .. "./git") -- Check if the current directory has the ".git" folder
        -- Additionally, double-check with Git to see if the local repo IS actually a Git repo
        and vim.fn.system({ "git", "rev-parse", "--show-level", "2>", "/dev/null" })
      then
        -- If both the conditions mentioned above fail, then return "false" for Lazy to not load the plugin
        return false
      end
    end,
  },

  {
    "folke/noice.nvim", -- Plugin which revamps the base Neovim look & feel completely
    event = "VimEnter", -- Ensure the plugin is loaded & available right when the UI is accessible
    config = function()
      require("noice").setup({
        cmdline = { view = "cmdline" }, -- Change the look of the commandline
        lsp = {
          -- Disable showing the LSP progress messages (doesn't appear to be working though)
          progress = { enable = false },
          -- Not exactly what are these overrides for but the documentations recommends using them
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
      })
    end,
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },
}
