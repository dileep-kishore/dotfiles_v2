local smart_borders = require "modules.smart_borders"
local awesome_navigator = require "awesomewm-vim-tmux-navigator"
local bling = require "modules.bling"
local rubato = require "modules.rubato"
local naughty = require "naughty"

local _M = {}

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

---- bling config
bling.module.flash_focus.enable()

-- These are example rubato tables. You can use one for just y, just x, or both.
-- The duration and easing is up to you. Please check out the rubato docs to learn more.
local anim_y = rubato.timed {
    pos = 1090,
    rate = 60,
    easing = rubato.quadratic,
    intro = 0.1,
    duration = 0.3,
    awestore_compat = true, -- This option must be set to true.
}

local anim_x = rubato.timed {
    pos = -970,
    rate = 60,
    easing = rubato.quadratic,
    intro = 0.1,
    duration = 0.3,
    awestore_compat = true, -- This option must be set to true.
}

_M.term_scratch = bling.module.scratchpad {
    command = "alacritty start --class spad", -- How to spawn the scratchpad
    rule = { instance = "spad" }, -- The rule that the scratchpad will be searched by
    sticky = true, -- Whether the scratchpad should be sticky
    autoclose = true, -- Whether it should hide itself when losing focus
    floating = true, -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
    geometry = { x = 360, y = 90, height = 900, width = 1200 }, -- The geometry in a floating state
    reapply = true, -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close = false, -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
    rubato = { x = anim_x, y = anim_y }, -- Optional. This is how you can pass in the rubato tables for animations. If you don't want animations, you can ignore this option.
}

_M.term_scratch:connect_signal("turn_on", function(c)
    naughty.notify { title = "Turned on!" }
end)

return _M
