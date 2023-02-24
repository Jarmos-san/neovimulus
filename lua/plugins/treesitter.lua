return {
  {
    "nvim-treesitter/nvim-treesitter", -- Plugin for better syntax highlighting & much more!
    build = function() -- Command to invoke after installing the plugin.
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufReadPost", "BufNewFile" }, -- Lazy-load the plugin only on certain events
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor", -- Rename stuff with the power of Treesitter!
      "JoosepAlviste/nvim-ts-context-commentstring", -- Plugin for better commenting on JSX/TSX files.
      "mrjones2014/nvim-ts-rainbow", -- Extension of bracket colours.
      "windwp/nvim-ts-autotag", -- Extension for automatic HTML tag completion.
      "nvim-treesitter/nvim-treesitter-textobjects", -- Navigate around code blocks more easily with this extension.
      "nvim-treesitter/playground", -- Extension for visualising the Treesitter nodes & graph.
    },
    opts = {
      -- Ensure the parsers for these languages are compulsarily installed
      ensure_installed = { "bash", "lua", "help", "json", "vim" },
      highlight = { enable = true }, -- Enable syntax highlighting using the Treesitter parsers
      indent = { enable = true }, -- Enable Treesitter-based indentation
      context_commentstring = { enable = true, enable_autocmd = false }, -- Enable easier commenting using Treesitter
      incremental_selection = { enable = true }, -- Incrementally select content powered by Treesitter
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts) -- Load the plugin with the config values mentioned above
    end,
  },
}
