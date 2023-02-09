-- Setup some bare minimum necessary keybindings to work with Neovim properly.
local map = vim.keymap.set
local opts = { silent = true }

map("i", "jk", "<Esc>") -- Press "jk" in quick succession to exit Insert mode.
map("n", "H", "<Home>") -- Press "H" to move to the start of the line.
map("n", "L", "<End>") -- Press "L" to move to the end of the line.
map("n", "<C-s>", "<CMD>write<CR>") -- Press "Ctrl + s" to write the current buffer like in VSCode.
map("n", "<C-a>", "ggVG") -- Select everything in the buffer like in VSCode (press "Ctrl + a").
map("n", "<Leader>fe", "<CMD>Neotree toggle<CR>", opts) -- Open the file explorer by pressing "Space + f + e".
map("n", "<Leader>bd", "<CMD>bdelete<CR>", opts) -- Delete an open buffer.
