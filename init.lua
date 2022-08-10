local map = vim.keymap

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Basic Neovim options which improves my quality of life when writing code.
vim.opt.number = true -- Enable the current row number of the left side.
vim.opt.autoindent = true -- Copy indent from the current line when starting a newline.
vim.opt.smartindent = true -- Make the indents smarter based on the "autoindents".
vim.opt.relativenumber = true -- Enable the number column on the left.
vim.opt.hlsearch = false -- Disable highlighting the searched keyword.
vim.opt.ignorecase = true -- Disable searching for case-specific keywords.
vim.opt.smartcase = true -- Intelligently figure out case-senstivity when looking up keywords.
vim.opt.scrolloff = 10 -- Maintain a buffer of 10 rows when scroll up/down.
-- vim.opt.cursorline = true -- Enables the cursorline which looks ugly without a proper colorscheme.
-- vim.opt.termguicolors = true -- Enables 24-bit colours (not sure if its required at all).
vim.opt.winblend = 0 -- Controls the transparency of the floating windows. Values range from 0-100.
vim.opt.wildoptions = "pum" -- Display the popup-menu for completions.
vim.opt.pumblend = 5 -- Controls the transparency of the popup-menu which appears during completions.
vim.opt.backup = false -- Disable creating backups before modifying a file.
vim.opt.showcmd = true -- Enable showcasing the current invoked command.
vim.opt.cmdheight = 1 -- Not sure what it does or how it helps. (lol?)
vim.opt.expandtab = true -- Insert appropriate number of Spaces when a <Tab> is pressed.
vim.opt.smarttab = true -- Insert Spaces when a <Tab> is pressed.
vim.opt.breakindent = true -- Wrap every line with proper indents.
vim.opt.backspace = { "start", "eol", "indent" } -- Perform appropriate actions when <Backspace> is pressed.
vim.opt.path:append({ "**" }) -- Search down subfolders when looking for files.
vim.opt.wildignore:append({ "**/node_modules/*" }) -- Ignore set of files & folders.

vim.wo.list = true -- Show invisible characters like whitespace in a buffer.

vim.g.mapleader = " " -- Remap the leader to "Space".
-- Assign what each type of whitespace should look like.
-- FIXME: It still doesn't work as I expect it to.
vim.g.listchars = {
      eol = "↴",
      tab = "→ ",
      space = "·",
      extends = "…",
      precedes = "…",
      trail = ".",
    }

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

-- Yank on highlight.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight the yanked text for a specified time.",
  group = vim.api.nvim_create_augroup("yank_highlight", { clear = true }),
  callback = function() vim.highlight.on_yank() end
})

-- Source the "init.lua" file on save.
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Source the 'init.lua' file on save.",
  group = vim.api.nvim_create_augroup("source_init_file", { clear = true }),
  pattern = "**/init.lua",
  command = "source <afile>"
})

-- Disable colour schemes to change the background colour.
vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Disable colorschemes to set/change the background colours.",
  group = vim.api.nvim_create_augroup("disable_colourscheme_background", { clear = true }),
  pattern = "*",
  callback = function() vim.cmd([[ highlight Normal ctermbg=None ]]) end
})
