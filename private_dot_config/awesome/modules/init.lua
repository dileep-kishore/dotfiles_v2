local smart_borders = require "modules.smart_borders"
local awesome_navigator = require "awesomewm-vim-tmux-navigator"

---- Smart borders config
smart_borders {
    layout = "ratio",
    border_width = 6,
    show_button_tooltips = true,
    align_horizontal = "center",
    rounded_corner = 14,
    color_normal = "#1a1b26",
    color_focus = "#7aa2f7",
    color_close_normal = {
        type = "linear",
        from = { 0, 0 },
        to = { 60, 0 },
        stops = { { 0, "#fd8489" }, { 1, "#1a1b26" } },
    },
    color_close_focus = {
        type = "linear",
        from = { 0, 0 },
        to = { 60, 0 },
        stops = { { 0, "#fd8489" }, { 1, "#7aa2f7" } },
    },
    color_close_hover = {
        type = "linear",
        from = { 0, 0 },
        to = { 60, 0 },
        stops = { { 0, "#FF9EA3" }, { 1, "#7aa2f7" } },
    },
    color_floating_normal = {
        type = "linear",
        from = { 0, 0 },
        to = { 40, 0 },
        stops = { { 0, "#1a1b26" }, { 1, "#ddace7" } },
    },
    color_floating_focus = {
        type = "linear",
        from = { 0, 0 },
        to = { 40, 0 },
        stops = { { 0, "#7aa2f7" }, { 1, "#ddace7" } },
    },
    color_floating_hover = {
        type = "linear",
        from = { 0, 0 },
        to = { 40, 0 },
        stops = { { 0, "#7aa2f7" }, { 1, "#F7C6FF" } },
    },
}

---- awesomewm-vim-tmux-navigator config
awesome_navigator {
    up = { "Up", "k" },
    down = { "Down", "j" },
    left = { "Left", "h" },
    right = { "Right", "l" },
    mod = "Mod4",
    mod_keysym = "Super_L",
    experimental = true,
    -- focus = collision.focus
}
