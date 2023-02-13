-- Configurations for the Treesitter plugin.
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "help", "comment" }, -- Ensure a couple of parsers are always installed.
    highlight = { enable = true }, -- Enable syntax highlighting using the parsers listed above.
    indent = { enable = true }, -- Indent source code using Treesitter!
    incremental_selection = { enable = true }, -- Not sure how it works & why!
    rainbow = { -- Enable treesitter-based bracket pair coloriser.
        enable = true,
        extended_mode = true,
        max_file_lines = 1000
    },
    autotag = { -- Enable Treesitter-based HTML tags.
        enable = true,
    },
    refactor = {
        highlight_definitions = { enable = true }, -- Highlight the definition of a function, class & such.
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definition = "gnD",
                list_definition_toc = "gO",
                goto_usage_next = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
        smart_rename = { -- Refactor source code using the power of Treesitter.
            enable = true,
            keymaps = { smart_rename = "grr" },
        },
    },
    -- Treesitter-based textobject manipulation! See the docs below for more information on the same.
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "Select a function block" },
                ["if"] = { query = "@function.inner", desc = "Select the contents of a function block" },
                ["ac"] = { query = "@class.outer", desc = "Select a class" },
                ["ic"] = { query = "@class.outer", desc = "Select the contents of the class" },
            },
        },
        swap = { enable = false }, -- TODO: Temporarily disabled until I can figure out its use case.
        move = { enable = false }, -- TODO: Temporarily disabled until I can figure out its use case.
        lsp_interop = { -- TODO: Figure out what its supposed to do & understand the use case.
            enable = true,
            peek_definition_code = {
                ["<Leader>df"] = { query = "@function.outer", desc = "Peek at the function description" },
                ["<Leader>dF"] = { query = "@class.outer", desc = "Peek at the class description" },
            },
        },
    },
    endwise = { enable = true }, -- No clue what its supposed to do.
    matchup = { enable = true }, -- No clue what its supposed to do.
})
