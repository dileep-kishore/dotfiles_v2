local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

mason.setup()

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --[[ ["rust_analyzer"] = function () ]]
    --[[     require("rust-tools").setup {} ]]
    --[[ end ]]
    ["jsonls"] = function ()
        local opts = {
            on_attach = require("user.lsp.handlers").on_attach,
            capabilities = require("user.lsp.handlers").capabilities,
        }
        local jsonls_opts = require "user.lsp.settings.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    end,
    ["sumneko_lua"] = function ()
        local opts = {
            on_attach = require("user.lsp.handlers").on_attach,
            capabilities = require("user.lsp.handlers").capabilities,
        }
        local sumneko_opts = require "user.lsp.settings.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    end,
    ["tsserver"] = function ()
        local opts = {
            on_attach = require("user.lsp.handlers").on_attach,
            capabilities = require("user.lsp.handlers").capabilities,
        }
        local tsserver_opts = require "user.lsp.settings.tsserver"
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
        opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
        end
    end,
    ["eslint"] = function ()
        local opts = {
            on_attach = require("user.lsp.handlers").on_attach,
            capabilities = require("user.lsp.handlers").capabilities,
        }
        local eslint_opts = require "user.lsp.settings.eslint"
        opts = vim.tbl_deep_extend("force", eslint_opts, opts)
    end,
}

local status_ok, mason_tools = pcall(require, "mason-tool-installer")
if not status_ok then
    return
end

mason_tools.setup {
    ensure_installed = {
        "bash-language-server",
        "stylua",
        "shellcheck",
        "editorconfig-checker",
        "shfmt",
        "lua-language-server", -- sumneko_lua
        "prettier",
    },
    autoupdate = false,
    run_on_start = false,
}
