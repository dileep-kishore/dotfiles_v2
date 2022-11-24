---- Tokyo Night

-- config
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- load the colorscheme
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

catppuccin.setup({
    flavor = "mocha", -- latte, frappe, macchiato, mocha
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.10,
    },
    integrations = {
        gitsigns = true,
        leap = true,
        mason = true,
        neogit = true,
        cmp = true,
        nvimtree = true,
        treesitter = true,
        treesitter_context = true,
        telescope = true,
        which_key = true,
        dap = {
            enabled = true,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
        }
    }
})
vim.cmd [[colorscheme catppuccin]]

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
