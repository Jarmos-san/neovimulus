-- Module for configuring various global autocommands for Neovim
--
local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
  return vim.api.nvim_create_augroup("augroup" .. name, { clear = true })
end

autocmd("TextYankPost", {
  desc = "Highlight the yanked text for a specified time.",
  group = augroup("yank_highlight"),
  callback = function()
    vim.highlight.on_yank({ timeout = 250 }) -- Keep the highlight for 250ms after yanking.
  end,
})

autocmd("FileType", {
  desc = "When opening Git commit messages, start the buffer in Insert mode",
  group = augroup("git_insert"),
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1",
})

autocmd("FocusLost", {
  desc = "Save/write all unsaved buffers when focus is lost",
  group = augroup("save_buffers"),
  pattern = "*",
  command = "silent! wall",
})

autocmd("BufReadPost", {
  desc = "Jump to the last known position of a file before closing it",
  group = augroup("buffer_checkpoint"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd("VimResized", {
  desc = "Resize the splits if the window is resized",
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

autocmd("FileType", {
  desc = "Close some filtypes simply by pressing 'q'",
  group = augroup("close_with_q"),
  pattern = { "qf", "help", "man", "notify", "lspinfo", "tsplayground", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

autocmd({ "CursorMoved", "CursorMovedI" }, {
  desc = "Redraw the cursorline when navigating around the buffer",
  group = augroup("cursorline_number"),
  callback = function()
    if vim.wo.cursorline then
      vim.cmd("redraw")
    end
  end,
})
