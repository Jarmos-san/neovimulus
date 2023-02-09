-- Configurations for the colorschemes.
local onedark = require("onedark")

-- Configure the OneDark colorscheme to be dark enough for my eyes.
onedark.setup({
    style = "darker",
})

-- Load the colorscheme which is similar to running the -
-- "vim.cmd([[ colorscheme onedark ]]) command.
onedark.load()
