---- Tokyo Night

-- config
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- load the colorscheme
vim.cmd [[colorscheme tokyonight]]

-- registers window
vim.g.registers_window_border = "rounded"

-- scrollbar
local status_ok, tokyonight = pcall(require, "tokyonight.colors")
if not status_ok then
    return
end

local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
    return
end

local status_ok, scrollbar_search = pcall(require, "scrollbar.handlers.search")
if not status_ok then
    return
end

local colors = tokyonight.setup()

scrollbar.setup {
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    },
}

scrollbar_search.setup()
