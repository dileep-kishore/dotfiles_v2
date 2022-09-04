local wezterm = require "wezterm"

--[[ return { ]]
--[[     font = wezterm.font "Cascadia Code PL", ]]
--[[     colors = { ]]
--[[         foreground = "#c0caf5", ]]
--[[         background = "#1a1b26", ]]
--[[         cursor_bg = "#c0caf5", ]]
--[[         cursor_border = "#c0caf5", ]]
--[[         cursor_fg = "#1a1b26", ]]
--[[         selection_bg = "#33467C", ]]
--[[         selection_fg = "#c0caf5", ]]
--[[         ansi = { "#15161E", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" }, ]]
--[[         brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" }, ]]
--[[     }, ]]
--[[ } ]]

return {
    force_reverse_video_cursor = true,
    colors = {
        foreground = "#dcd7ba",
        background = "#1f1f28",

        cursor_bg = "#c8c093",
        cursor_fg = "#c8c093",
        cursor_border = "#c8c093",

        selection_fg = "#c8c093",
        selection_bg = "#2d4f67",

        scrollbar_thumb = "#16161d",
        split = "#16161d",

        ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
        brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
        indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
    },
}
