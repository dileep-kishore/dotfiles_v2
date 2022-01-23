local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
    end,
    sources = {
        formatting.prettier.with {
            disabled_filetypes = { "typescript", "typescriptreact" },
        },
        formatting.clang_format,
        formatting.black,
        formatting.stylua.with {
            extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
        },
        -- formatting.fixjson,
        formatting.eslint_d.with {
            prefer_local = "node_modules/.bin",
        },
        formatting.stylelint,
        -- formatting.styler,
        -- formatting.latexindent,
        formatting.markdownlint,
        formatting.rustfmt,
        formatting.shfmt.with {
            filetypes = { "bash", "zsh", "sh" },
        },
        -- NOTE: Diagnostics can be handled with lsp servers
        -- diagnostics.codespell,
        -- diagnostics.mypy,
        -- diagnostics.pylint,
        -- diagnostics.jsonlint,
        -- diagnostics.luacheck,
        -- diagnostics.markdownlint,
        -- diagnostics.proselint,
        -- diagnostics.shellcheck,
        -- diagnostics.yamllint,
    },
}
