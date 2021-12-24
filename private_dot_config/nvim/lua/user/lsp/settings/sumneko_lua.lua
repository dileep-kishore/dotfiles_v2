return {
    settings = {

        Lua = {
            diagnostics = {
                enable = true,
                globals = {
                    -- Vim
                    "vim",
                    -- Awesome
                    "awesome",
                    "client",
                    "root",
                },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/lsp"] = true,
                    ["/usr/share/awesome/lib"] = true,
                },
            },
        },
    },
}
