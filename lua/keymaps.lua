-- Setup some bare minimum necessary keybindings to work with Neovim properly.
local map = vim.keymap.set
local opts = { silent = true }
-- local wk = require("which-key")

map("i", "jk", "<Esc>") -- Press "jk" in quick succession to exit Insert mode.
map("n", "H", "<Home>") -- Press "H" to move to the start of the line.
map("n", "L", "<End>") -- Press "L" to move to the end of the line.
map("n", "<C-s>", "<CMD>write<CR>") -- Press "Ctrl + s" to write the current buffer like in VSCode.
map("n", "<C-a>", "ggVG") -- Select everything in the buffer like in VSCode (press "Ctrl + a").
map("n", "<CMD>Neotree toggle<CR>", "<Leader>fe", opts) -- Toggle the file explorer either open/close.

-- wk.register({
--     ["<Leader>b"] = {
--         name = "buffer",
--         d = { "<CMD>bdelete<CR>", desc = "Remove the current open buffer" },
--         n = { "<CMD>bnext<CR>", desc = "Switch to the next open buffer" },
--     },
--
--     ["<Leader>l"] = {
--         name = "LSP",
--         i = { "<CMD>LspInfo<CR>", "Open the LSP information UI" },
--         d = { vim.diagnostic.open_float, "Open the LSP diagnostic window" },
--     },
--
--     ["<Leader>t"] = {
--         name = "Terminal",
--         t = { "<CMD>ToggleTerm direction=float<CR>", "Toggle the terminal open/close" },
--     },
-- })

