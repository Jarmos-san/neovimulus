return {
    {
        -- A pretty colorscheme inspired from the now defunct Atom editor.
        "navarasu/onedark.nvim",
        event = "UIEnter", -- Load the colorscheme immediately after startup to avoid unexpected behaviours.
        config = function() -- Configuration for the colorscheme.
            require("configs.colorscheme")
        end,
    },

    {
        -- Plugin for better & faster syntax highlighting using the Rust-based project, Treesitter.
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" }, -- Load the plugin after a buffer is created/read.
        dependencies = { -- A couple of more "extensions" which works well with the plugin.
            "nvim-treesitter/nvim-treesitter-refactor", -- Rename stuff with the power of Treesitter!
            "JoosepAlviste/nvim-ts-context-commentstring", -- Plugin for better commenting on JSX/TSX files.
            "mrjones2014/nvim-ts-rainbow", -- Extension of bracket colours.
            "windwp/nvim-ts-autotag", -- Extension for automatic HTML tag completion.
            "nvim-treesitter/nvim-treesitter-textobjects", -- Navigate around code blocks more easily with this extension.
            "nvim-treesitter/playground", -- Extension for visualising the Treesitter nodes & graph.
        },
        build = ":TSUpdate", -- Update all the parsers when the plugin is updated/installed.
        config = function() -- Configuration for the plugin.
            require("configs.treesitter")
        end,
    },

    {
        -- Official plugin for more ease in configuring the in-built LSP client.
        "neovim/nvim-lspconfig",
        event = "BufReadPost", -- Lazy-load the plugin only after the Neovim UI is loaded.
        config = function() -- Configurations for the many LSP servers used within Neovim.
            require("configs.lsp")
        end,
    },

    {
        -- Plugin for VSCode-like snippets powered by Neovim's in-built LSP.
        "L3MON4D3/LuaSnip",
        event = "InsertEnter", -- Lazy-load the plugin only when the buffer is in Insert mode.
        dependencies = { -- Load these dependencies when the snippet plugin is used.
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "rafamadriz/friendly-snippets"
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
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "doxnit/cmp-luasnip-choice",
        },
        config = function() -- Configuration module for the autocompletion module.
            require("configs.cmp")
        end,
        event = "InsertEnter", -- Lazy-load the plugin only when the buffer is in Insert mode.
    },

    {
        -- A friendly plugin for managing the LSP servers more easily.
        "williamboman/mason.nvim",
        config = function() -- Configuration module for the plugin.
            require("configs.mason")
        end,
        cmd = "Mason", -- Lazy-load the plugin only when this command is invoked.
        -- Load this dependency when the plugin is loaded as well.
        dependencies = "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    {
        -- Extension for "mason.nvim" which makes it VERY easy to auto-install LSP servers.
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            -- TODO: Figure a way out to move these contents to the "mason.lua" module.
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
        disable = true, -- FIXME: Disable plugin temporarily until its fixed.
        event = "BufReadPost", -- Load the plugin only when the buffer is read & filetype is known.
        dependencies = { -- Load some necessary dependencies for the plugin.
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function() -- Configuration module for the plugin.
            -- require("configs.null-ls")
        end,

    },

    {
        -- Plugin for more easily commenting out blocks of code.
        "numToStr/Comment.nvim",
        event = "BufReadPost", -- Load the plugin only after the buffer is read.
        config = true, -- Setup the plugin for it to be initialised & work.
    },

    {
        -- Plugin for automatically inserting bracket pairs & much more.
        "windwp/nvim-autopairs",
        event = "InsertEnter", -- Load the plugin only when entering Insert mode.
        config = true, -- Setup the plugin to be initialised & work as expected.
    },

    {
        -- Plugin for properly visualising the indent lines & much more.
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost", -- Load the plugin only the buffer is read.
        config = true -- Configurations for the plugin.
    },

    {
        -- Plugin for a custom & pretty-looking statusline.
        "nvim-lualine/lualine.nvim",
        event = "UIEnter", -- Load the plugin only after Neovim's UI has loaded.
        config = true, -- Configurations for the plugin.
    },

    {
        -- Plugin for easy-to-use & manage file explorer.
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree", -- Command which calls the plugin lazily.
        config = function()
            require("configs.neo-tree") -- Configuration module for the plugin.
        end,
        dependencies = { -- Dependencies for the plugin which provides async, Nerd Font icons & a nice UI support.
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },

    {
        -- Plugin for a better more useful dashboard than the default one.
        "goolord/alpha-nvim",
        disable = true, -- Disable it temporarily for now (need to customise the dashboard before it can work properly)
        event = "UIEnter", -- Load the plugin when the UI is loaded first.
        dependencies = {
            "kyazdani42/nvim-web-devicons" -- Extra plugin which "alpha.nvim" relies on for the icon support.
        }
    },
}
