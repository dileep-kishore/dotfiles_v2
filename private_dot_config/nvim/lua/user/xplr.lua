local status_ok, xplr = pcall(require, "xplr")
if not status_ok then
    return
end

xplr.setup {
    ui = {
        border = {
            style = "single",
            highlight = "FloatBorder",
        },
        position = {
            row = "90%",
            col = "50%",
        },
        relative = "editor",
        size = {
            width = "80%",
            height = "70%",
        },
    },
    previewer = {
        split = true,
        split_percent = 0.5,
        ui = {
            border = {
                style = "single",
                highlight = "FloatBorder",
            },
            position = { row = "3%", col = "100%" },
            relative = "editor", -- editor only supported for now
            size = {
                width = "30%",
                height = "100%",
            },
        },
    },
    xplr = {
        open_selection = {
            enabled = true,
            mode = "action",
            key = "o",
        },
        preview = {
            enabled = true,
            mode = "action",
            key = "i",
            fifo_path = "/tmp/nvim-xplr.fifo",
        },
        set_nvim_cwd = {
            enabled = true,
            mode = "action",
            key = "j",
        },
        set_xplr_cwd = {
            enabled = true,
            mode = "action",
            key = "h",
        },
    },
}

local opts = { noremap = true, silent = true }
local nvim_set_keymap = vim.api.nvim_set_keymap
local mappings = require "xplr.mappings"
local set_keymap = mappings.set_keymap
local on_previewer_set_keymap = mappings.on_previewer_set_keymap

nvim_set_keymap("n", "<space>xx", '<Cmd>lua require"xplr".open()<CR>', opts) -- open/focus cycle
set_keymap("t", "<space>xx", '<Cmd>lua require"xplr".focus()<CR>', opts) -- open/focus cycle

nvim_set_keymap("n", "<space>xc", '<Cmd>lua require"xplr".close()<CR>', opts)
set_keymap("t", "<space>xc", '<Cmd>lua require"xplr".close()<CR>', opts)

nvim_set_keymap("n", "<space>xv", '<Cmd>lua require"xplr".toggle()<CR>', opts)
set_keymap("t", "<space>xv", '<Cmd>lua require"xplr".toggle()<CR>', opts)

on_previewer_set_keymap("t", "<space>xb", '<Cmd>lua require"xplr.actions".scroll_previewer_up()<CR>', opts)
on_previewer_set_keymap("t", "<space>xn", '<Cmd>lua require"xplr.actions".scroll_previewer_down()<CR>', opts)
