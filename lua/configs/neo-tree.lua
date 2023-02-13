vim.fn.sign_define("DiagnosticSignError", {
    text = " ",
    texthl = "DiagnosticSignError",
})
vim.fn.sign_define("DiagnosticSignWarn", {
    text = " ",
    texthl = "DiagnosticSignWarn",
})
vim.fn.sign_define("DiagnosticSignInfo", {
    text = " ",
    texthl = "DiagnosticSignInfo",
})
vim.fn.sign_define("DiagnosticSignHint", {
    text = " ",
    texthl = "DiagnosticSignHint",
})

require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
        position = "left",
        width = "25",
    },
    filesystem = {
        hijack_netrw_behavior = "open_current",
        filtered_items = {
            hide_dotfiles = false,
            hide_by_name = {
                ".git",
                ".mypy_cache",
                "node_modules",
                "__pycache__",
                ".venv",
            },
        },
        git_status = {
            symbols = {
                deleted = "✖",
                renamed = "",
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
    },
})
