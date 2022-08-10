local map = vim.keymap

-- Basic Neovim options which improves my quality of life when writing code.
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.wo.list = true

vim.g.mapleader = " "
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
