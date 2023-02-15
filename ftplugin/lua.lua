local autocmd = vim.api.nvim_create_autocmd

-- Add a nice & clean coloured column line at EOL.
vim.opt.cursorcolumn = { 120 }

-- Load Treesitter-based syntax highlight using the inbuilt parser.
autocmd("FileType", {
    pattern = { "lua", "help" },
    callback = function()
        vim.treesitter.start()
    end,
})
