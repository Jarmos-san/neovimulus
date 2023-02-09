-- Setup some bare minimum necessary keybindings to work with Neovim properly.
local map = vim.keymap.set
local opts = { silent = true }

map("i", "jk", "<Esc>") -- Press "jk" in quick succession to exit Insert mode.
map("n", "<C-s>", "<CMD>write<CR>") -- Press "Ctrl + s" to write the current buffer like in VSCode.
