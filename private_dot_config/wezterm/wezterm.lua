local wezterm = require "wezterm"

return {
    font = wezterm.font "Cascadia Code PL",
    colors = {
        foreground = "#c0caf5",
        background = "#1a1b26",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#1a1b26",
        selection_bg = "#33467C",
        selection_fg = "#c0caf5",
        ansi = { "#15161E", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
        brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
    },
}
