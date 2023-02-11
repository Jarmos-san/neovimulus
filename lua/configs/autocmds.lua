local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
	desc = "Highlight the yanked text for a specified time.",
	group = augroup("yank_highlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 250 }) -- Keep the highlight for 250ms after yanking.
	end,
})

autocmd("FileType", {
    desc = "When opening Git commit messages, start the buffer in Insert mode",
    group = augroup("git_insert", { clear = true }),
    pattern = { "gitcommit", "gitrebase" },
    command = "startinsert | 1"
})

autocmd("FocusLost", {
    desc = "Save/write all unsaved buffers when focus is lost",
    group = augroup("save_buffers", { clear = true }),
    pattern = "*",
    command = "silent! wall",
})

autocmd("BufReadPost", {
    desc = "Jump to the last known position of a file before closing it",
    group = augroup("buffer_checkpoint", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)

        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})

-- INFO: See the documentations below for an explanation on it works:
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim#events
autocmd("User", {
    desc = "Print a helpful message when Mason is about to install the LSP servers",
    group = augroup("mason", { clear = true }),
    pattern = "MasonToolsStartingInstall",
    callback = function()
        vim.schedule(function()
            print("Mason is starting...")
        end)
    end,
})

autocmd("User", {
    desc = "Print a helpful message when Mason is done updating the LSP servers",
    group = augroup("mason", { clear = true }),
    pattern = "MasonToolsUpdateCompleted",
    callback = function()
        vim.schedule(function()
            print("Mason completed updating LSP servers...")
        end)
    end,
})
