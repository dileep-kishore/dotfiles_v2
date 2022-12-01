local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

mason.setup()

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

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

mason_lspconfig.setup()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, lsp_handlers = pcall(require, "user.lsp.handlers")
if not status_ok then
    return
end


--[[ lspconfig.r_language_server.setup { ]]
--[[     on_attach = require("user.lsp.handlers").on_attach, ]]
--[[     capabilities = require("user.lsp.handlers").capabilities, ]]
--[[ } ]]

local on_attach = lsp_handlers.on_attach
local capabilities = lsp_handlers.capabilities

mason_lspconfig.setup_handlers {
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup {}
    end,
    ["jsonls"] = function()
        local jsonls_opts = require "user.lsp.settings.jsonls"
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    end,
    ["sumneko_lua"] = function()
        local sumneko_opts = require "user.lsp.settings.sumneko_lua"
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    end,
    ["tsserver"] = function()
        local tsserver_opts = require "user.lsp.settings.tsserver"
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
        opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
        end
    end,
    ["eslint"] = function()
        local eslint_opts = require "user.lsp.settings.eslint"
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        opts = vim.tbl_deep_extend("force", eslint_opts, opts)
    end,
}
