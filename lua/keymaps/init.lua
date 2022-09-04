--[
-- =================================================================================
-- Setup some bare minimum keymaps for easier navigation inside the Neovim environment.
-- =================================================================================
--]

local map = vim.keymap

-- Basic keymaps for better navigation within Neovim.
map.set("i", "jk", "<Esc>") -- Press "jk" in quick succession to exit Insert mode.
map.set("n", "H", "<Home>") -- Press capital "h" to move to the beginning of a line in Normal mode.
map.set("n", "L", "<End>") -- Press capital "l" to move to the end of the line in Normal mode.

map.set("n", "<C-s>", ":write<CR>") -- Press "Ctrl + s" to save the modifications made in a buffer.
map.set("n", "<C-a>", "ggVG") -- Press "Ctrl + a" to select all texts in a buffer.

map.set("n", "<C-o>", ":tabedit<CR>") -- Press "Ctrl + o" to open a new tab.
map.set("n", "<C-c>", ":tabclose<CR>") -- Press "Ctrl + c" to close an open tab.

-- Split the windows of the current buffer & change focus on to it.
map.set("n", "ss", ":split<CR><C-w>w") -- Open a horizontal split.
map.set("n", "sv", ":vsplit<CR><C-w>w") -- Open a vertical split.
map.set("n", "sh", "<C-w>h") -- Navigate to the split window on the immediate left.
map.set("n", "sj", "<C-w>j") -- Navigate to the split window below.
map.set("n", "sk", "<C-w>k") -- Navigate to the split window top.
map.set("n", "sl", "<C-w>l") -- Navigate to the split window on the immediate right.

-- Resize windows
map.set("n", "<C-w><left>", "<C-w><")
map.set("n", "<C-w><right>", "<C-w>>")
map.set("n", "<C-w><up>", "<C-w>+")
map.set("n", "<C-w><down>", "<C-w>-")
