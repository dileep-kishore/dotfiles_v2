local status_ok, nlspsettings = pcall(require, "nlspsettings")
if not status_ok then
    return
end

nlspsettings.setup {
    config_home = vim.fn.stdpath "config" .. "/nlsp-settings",
    local_settings_root_markers = { ".git" },
    jsonls_append_default_schemas = true,
}
