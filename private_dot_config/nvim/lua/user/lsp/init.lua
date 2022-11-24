require "user.lsp.lsp-mason"

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.nlspsettings"
require "user.lsp.trouble"
require("navigator").setup()

--[[ lspconfig.r_language_server.setup { ]]
--[[     on_attach = require("user.lsp.handlers").on_attach, ]]
--[[     capabilities = require("user.lsp.handlers").capabilities, ]]
--[[ } ]]
