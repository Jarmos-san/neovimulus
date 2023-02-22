local null_ls = require("null-ls")

null_ls.setup({
    border = "rounded",
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("formatter_group", { clear = true }),
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        timeout_ms = 6000,
                        bufnr = bufnr,
                        filter = function()
                            return client.name == "null-ls"
                        end
                    })
                end
            })
        end
    end,

    sources = {
        null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
        null_ls.builtins.diagnostics.selene.with({
            condition = function(utils)
                return utils.root_has_file({ "selen.toml", "vim.tom" })
            end
        }),
    },
})
