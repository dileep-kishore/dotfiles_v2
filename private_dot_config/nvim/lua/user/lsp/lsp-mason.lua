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
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- TODO: Maybe the r_language_server config from lsp/init.lua
    --[[ ["rust_analyzer"] = function () ]]
    --[[     require("rust-tools").setup {} ]]
    --[[ end ]]
}

local status_ok, mason_tools = pcall(require, "mason-tool-installer")
if not status_ok then
    return
end

mason_tools.setup {
    ensure_installed = {
        'bash-language-server',
        'stylua',
        'shellcheck',
        'editorconfig-checker',
        'shfmt',
        'lua-language-server', -- sumneko_lua
        'prettier',
    },
    autoupdate = false,
    run_on_start = false,
}
