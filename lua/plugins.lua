return {
    {
        -- A pretty colorscheme inspired from the now defunct Atom editor.
        "navarasu/onedark.nvim",
        event = "UIEnter", -- Load the colorscheme only after the Neovim UI is loaded.
        config = function() -- Configuration for the colorscheme.
            -- TODO: Reconsider moving the colorscheme configuration to some other directory.
            local onedark = require("onedark")

            onedark.setup({
                style = "darker",
            })

            onedark.load()
        end,
    },
    {
        -- Plugin for better & faster syntax highlighting using the Rust-based project, Treesitter.
        "nvim-treesitter/nvim-treesitter",
        event = "BufEnter", -- Load the plugin only when the current buffer is loaded.
        dependencies = { -- A couple of more "extensions" which works well with the plugin.
            -- TODO: Add a couple more Treesitter extensions.
            "nvim-treesitter/nvim-treesitter-refactor", -- Rename stuff with the power of Treesitter!
        },
        build = ":TSUpdate", -- Update all the parsers when the plugin is updated/installed.
        config = function() -- Configuration for the plugin.
            -- TODO: Reconsider moving the configuration to a seperate module.
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "help", "comment" }, -- Ensure a couple of parsers are always installed.
                highlight = { enable = true }, -- Enable syntax highlighting using the parsers listed above.
                indent = { enable = true }, -- Indent source code using Treesitter!
                incremental_selection = { enable = true }, -- Not sure how it works & why!
                refactor = {
                    smart_rename = { -- Refactor source code using the power of Treesitter.
                        enable = true,
                        keymaps = { smart_rename = "grr" },
                    },
                },
                endwise = { enable = true }, -- No clue what its supposed to do.
                matchup = { enable = true }, -- No clue what its supposed to do.
            })
        end,
    },
}
