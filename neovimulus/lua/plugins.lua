return {
  {
    "goolord/alpha-nvim", -- Plugin to load a nice dashboard with utilities in the startup screen
    event = "VimEnter", -- Load the plugin right after entering the UI
    opts = function()
      -- Load the configurations for the Alpha dashboard
      local dashboard = require("alpha.themes.dashboard")

      -- Configure some utilitarian buttons to show on the dashboard
      dashboard.section.buttons.val = {
        dashboard.button("n", " " .. " Create & Open a New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("n", " " .. " Open the File Explorer", "<CMD>Neotree toggle<CR>"),
        dashboard.button("c", " " .. " Configure Local Neovim environment", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "鈴" .. " Open the Lazy Dashboard", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit Out of Neovim", ":qa<CR>"),
      }

      -- Configure some highlight groups for the utilitarian buttons mentioned above
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8

      return dashboard
    end,
    config = function(_, dashboard)
      -- Logic to show Lazy stats on the Alpha dashboard properly
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          group = vim.api.nvim_create_augroup("show_lazy_on_alpha_ready", { clear = true }),
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts) -- Initiliase the Alpha dashboard with the configurations above

      -- Autocommand to show load times of all the installed plugins right within the Alpha dashboard
      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("show_lazy_stats_on_alpha", { clear = true }),
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"

          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

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
    "navarasu/onedark.nvim", -- The default colorscheme used right now
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

  {
    -- Official plugin for more ease in configuring the in-built LSP client.
    "neovim/nvim-lspconfig",
    -- event = "BufReadPost", -- Lazy-load the plugin only after the Neovim UI is loaded.
    config = function() -- Configurations for the many LSP servers used within Neovim.
      require("configs.lsp")
    end,
    dependencies = {
      -- This plugin needs to be loaded as well otherwise Neovim can't find the LSP binary on $PATH.
      "williamboman/mason.nvim",
    },
  },

  {
    -- Plugin for VSCode-like snippets powered by Neovim's in-built LSP.
    "L3MON4D3/LuaSnip",
    event = "InsertEnter", -- Lazy-load the plugin only when the buffer is in Insert mode.
    dependencies = { -- Load these dependencies when the snippet plugin is used.
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "rafamadriz/friendly-snippets",
    },
  },

  {
    -- Extra plugin for a more VSCode-like snippets behaviour.
    "rafamadriz/friendly-snippets",
    events = "InsertEnter", -- Lazy-load the plugin only when the buffer is in an Insert mode.
  },

  {
    -- Better autocompletion support for Neovim.
    "hrsh7th/nvim-cmp",
    dependencies = { -- A bunch of extra extensions for the autocompletions plugin.
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() -- Configuration module for the autocompletion module.
      require("configs.cmp")
    end,
    event = "InsertEnter", -- Lazy-load the plugin only when the buffer is in Insert mode.
  },

  {
    -- A friendly plugin for managing the LSP servers more easily.
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" }, -- Enable a nice-looking UI for the Mason floating window
        log_level = vim.log.levels.INFO, -- Enable DEBUG mode when LSP things needs a bit of debugging
      })
    end,
    cmd = "Mason", -- Lazy-load the plugin only when this command is invoked.
    -- Load this dependency when the plugin is loaded as well.
    dependencies = "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  {
    -- Extension for "mason.nvim" which makes it VERY easy to auto-install LSP servers.
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        -- Ensure the following LSP servers are always installed & made available on $PATH.
        ensure_installed = { "lua-language-server", "stylua", "selene", "shfmt", "shellcheck" },
        auto_update = true, -- Ensure the installed LSP servers are always up-to-date.
      })
    end,
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" }, -- Lazy-load the extension only when these commands are invoked.
  },

  {
    -- Plugin for using the builtin LSP client to hook into other non-LSP tools like Prettier & ESLint.
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPost", -- Load the plugin only when the buffer is read & filetype is known.
    dependencies = { -- Load some necessary dependencies for the plugin.
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function() -- Configuration module for the plugin.
      require("configs.null-ls")
    end,
  },

  {
    "folke/trouble.nvim", -- Plugin to display the diagnostic messages in a floating window
    config = true, -- Initialise the plugin with some default configurations
    dependencies = { "kyazdani42/nvim-web-devicons" }, -- Dependency plugin for Nerd Font icon support
    cmd = { "Trouble" }, -- Lazy load the plugin when this command is called
  },

  {
    "nvim-lualine/lualine.nvim", -- Plugin for configuring a nice looking statusline
    event = "VeryLazy", -- Load the plugin when Lazy wants it to
    config = function()
      require("lualine").setup({
        options = {
          -- Leaving an empty table renders the square-edged components, else the default angled ones are loaded
          section_separators = "",
          component_separator = "|",
          theme = "codedark", -- Set the theme
          globalstatus = true,
          disabled_filetypes = { -- Disable the statusline for certain filetypes mentioned below
            statusline = { "filesytem", "neo-tree", "dashboard", "lazy", "alpha" },
          },
        },
        sections = {
          lualine_c = "lsp_progress",
          -- Statusline components to showcase on the right-most end
          lualine_x = "filetype",
          lualine_y = "progress",
          lualine_z = "location",
        },
      })
    end,
  },

  {
    "echasnovski/mini.trailspace", -- Plugin to visualise trailing whitespaces
    event = "InsertLeave", -- Only load the plugin when leaving Insert mode
    config = function()
      require("mini.trailspace").setup() -- Initialise the plugin with defaults
    end,
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
    "echasnovski/mini.indentscope", -- Plugin to visualise & animate indent lines
    event = "BufReadPost", -- Lazy load the plugin only after the buffer is read
    config = function()
      require("mini.indentscope").setup({
        -- Disable the animation of the indent line visualisation
        draw = { animation = require("mini.indentscope").gen_animation.none() },
      })
    end,
  },

  {
    "echasnovski/mini.pairs", -- Plugin for automatically inserting bracket pairs
    event = "InsertEnter", -- Load the plugin only when entering Insert mode.
    opts = {
      modes = {
        insert = true, -- Enable insert bracket pairs automatically in Insert mode
        command = true, -- Enable bracket pair insertion in Command mode
        terminal = true, -- Enable bracket pair insertion in Terminal mode
      },
    },
    config = function(opts) -- Initialise the plugin with the configurations mentioned above
      require("mini.pairs").setup(opts)
    end,
  },

  {
    "echasnovski/mini.trailspace", -- Plugin to visualise trailing whitespaces
    event = "InsertLeave", -- Only load the plugin when leaving Insert mode
    config = function()
      require("mini.trailspace").setup() -- Initialise the plugin with defaults
    end,
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
    "echasnovski/mini.indentscope", -- Plugin to visualise & animate indent lines
    event = "BufReadPost", -- Lazy load the plugin only after the buffer is read
    config = function()
      require("mini.indentscope").setup({
        -- Disable the animation of the indent line visualisation
        draw = { animation = require("mini.indentscope").gen_animation.none() },
      })
    end,
  },

  {
    "echasnovski/mini.pairs", -- Plugin for automatically inserting bracket pairs
    event = "InsertEnter", -- Load the plugin only when entering Insert mode.
    opts = {
      modes = {
        insert = true, -- Enable insert bracket pairs automatically in Insert mode
        command = true, -- Enable bracket pair insertion in Command mode
        terminal = true, -- Enable bracket pair insertion in Terminal mode
      },
    },
    config = function(opts) -- Initialise the plugin with the configurations mentioned above
      require("mini.pairs").setup(opts)
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim", -- Plugin to manage & access the file system using an explorer
    cmd = "Neotree", -- Lazy-load the plugin only when the "Neotree" command is invoked
    keys = {
      {
        "<leader>fe", -- Press "Space + f + e" to toggle open/close the file explorer
        function()
          -- Open the file explorer in the current directory.
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Open the Neotree file explorer",
      },
    },
    deactivate = function() -- Callback function to deactivate the plugin when necessary.
      vim.cmd([[ Neotree close]])
    end,
    init = function() -- Initialisation stuff before starting the plugin.
      vim.g.neo_tree_remove_legacy_commands = 1

      if vim.fn.argc() == 1 then -- Check if there's only one file opened with Neovim.
        -- Assign the first file opened with Neovim to the "stat" variable name.
        local stat = vim.loop.fs_stat(vim.fn.argv(0))

        -- Import the "Neotree" plugin module if the "stat" variable is a "directory"
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      close_if_last_window = true, -- Don't leave the plugin's window open as the last window
      enable_git_status = true, -- Enable Git VCS information for the current working directory
      enable_diagnostics = true, -- Enable diagnostic feedback for all files in the working directory
      filesystem = {
        hijack_netrw_behaviour = "open_current", -- Use the plugin instead of the default "netrw" plugin
        bind_to_cwd = false,
        follow_current_file = true,
        filtered_items = {
          -- ALWAYS show these files/folders even if by default dotfiles are configured to be hidden
          always_show = { ".github", ".gitignore", ".gitattributes", ".editorconfig" },
        },
      },
      window = {
        width = "25", -- Hard-code the size of the window width
      },
    },
    dependencies = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  },

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
      ensure_installed = { "bash", "lua", "help", "json", "vim", "comment", "regex", "markdown", "markdown_inline" },
      highlight = { enable = true }, -- Enable syntax highlighting using the Treesitter parsers
      indent = { enable = true }, -- Enable Treesitter-based indentation
      context_commentstring = { enable = true, enable_autocmd = false }, -- Enable easier commenting using Treesitter
      incremental_selection = { enable = true }, -- Incrementally select content powered by Treesitter
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts) -- Load the plugin with the config values mentioned above
    end,
  },

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
