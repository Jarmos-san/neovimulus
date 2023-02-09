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
}
