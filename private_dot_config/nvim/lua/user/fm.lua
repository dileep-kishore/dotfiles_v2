local status_ok, fm_nvim = pcall(require, "fm-nvim")
if not status_ok then
    return
end

fm_nvim.setup {
    edit_cmd = "edit",

    -- See `Q&A` for more info
    on_close = {},
    on_open = {},

    -- UI Options
    ui = {
        -- Default UI (can be "split" or "float")
        default = "float",

        float = {
            -- Floating window border (see ':h nvim_open_win')
            border = "rounded",

            -- Highlight group for floating window/border (see ':h winhl')
            float_hl = "Normal",
            border_hl = "FloatBorder",

            -- Floating Window Transparency (see ':h winblend')
            blend = 0,

            -- Num from 0 - 1 for measurements
            height = 0.7,
            width = 0.7,

            -- X and Y Axis of Window
            x = 0.5,
            y = 0.5,
        },

        split = {
            -- Direction of split
            direction = "topleft",

            -- Size of split
            size = 24,
        },
    },

    -- Terminal commands used w/ file manager (have to be in your $PATH)
    cmds = {
        nnn_cmd = "nnn",
        fzf_cmd = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
        fzy_cmd = "find . | fzy",
        xplr_cmd = "xplr",
        gitui_cmd = "gitui",
        lazygit_cmd = "lazygit",
    },

    -- Mappings used with the plugin
    mappings = {
        vert_split = "<C-v>",
        horz_split = "<C-x>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        ESC = "<ESC>",
    },
}
