-- FIXME: Check if the LSP servers installed using this plugin really works or not.
require("mason").setup({
    ui = { border = "rounded" }, -- Enable a nice-looking, rounded border for the UI.
    log_level = vim.log.levels.DEBUG -- Enable better debugging info for the LSP installer.
})
