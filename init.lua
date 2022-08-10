local map = vim.keymap

-- Basic Neovim options which improves my quality of life when writing code.
vim.opt.relativenumber = true -- Enable the number column on the left.
vim.opt.hlsearch = false -- Disable highlighting the searched keyword.
vim.opt.ignorecase = true -- Disable searching for case-specific keywords.
vim.opt.smartcase = true -- Intelligently figure out case-senstivity when looking up keywords.
vim.opt.scrolloff = 10 -- Maintain a buffer of 10 rows when scroll up/down.

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
map.set("i", "jk", "<Esc>")
map.set("n", "H", "<Home>")
map.set("n", "L", "<End>")
map.set("n", "<C-s>", ":write<CR>")
map.set("n", "<C-a>", "ggVG")

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
