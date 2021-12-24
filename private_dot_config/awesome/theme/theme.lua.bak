local theme_assets = require "beautiful.theme_assets"
local xresources = require "beautiful.xresources"
local gears = require "gears"
local dpi = xresources.apply_dpi

local gfs = require "gears.filesystem"
local icons_path = "~/.config/awesome/icons/"

local theme = {}

---- My config variables
theme.name = "tokyo-night"

theme.font = "Lato Medium 12"
theme.title_font = "Lato Medium 13"

theme.bg_normal = "#1a1b2600"
theme.bg_focus = "#1a1b26"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#7aa2f7"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(5)
theme.border_width = dpi(0)
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"
theme.border_marked = "#CC9393"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- local taglist_square_size = dpi(10)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Menu

theme.menu_height = dpi(16)
theme.menu_width = dpi(160)

-- Tooltips
theme.tooltip_bg = "#232323"
--theme.tooltip_border_color = '#232323'
theme.tooltip_border_width = 0
theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(6))
end

-- Taglist

theme.taglist_bg_empty = theme.bg_minimize
theme.taglist_bg_occupied = theme.bg_minimize
theme.taglist_bg_urgent = "linear:0,0:"
    .. dpi(40)
    .. ",0:0,"
    .. theme.bg_urgent
    .. ":0.08,"
    .. theme.bg_urgent
    .. ":0.08,"
    .. theme.bg_urgent
    .. ":1,"
    .. theme.bg_urgent
theme.taglist_bg_focus = "linear:0,0:"
    .. dpi(40)
    .. ",0:0,"
    .. theme.bg_focus
    .. ":0.08,"
    .. theme.bg_focus
    .. ":0.08,"
    .. theme.bg_focus
    .. ":1,"
    .. theme.bg_focus

-- Tasklist

theme.tasklist_font = "Roboto medium 11"
theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus = "linear:0,0:0,"
    .. dpi(40)
    .. ":0,"
    .. theme.fg_normal
    .. ":0.95,"
    .. theme.fg_normal
    .. ":0.95,"
    .. theme.fg_normal
    .. ":1,"
    .. theme.fg_normal
theme.tasklist_bg_urgent = theme.bg_urgent
theme.tasklist_fg_focus = "#DDDDDD"
theme.tasklist_fg_urgent = theme.fg_normal
theme.tasklist_fg_normal = "#AAAAAA"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = icons_path .. "submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
-- theme.titlebar_close_button_normal = icons_path .. "titlebar/close_normal.png"
-- theme.titlebar_close_button_focus = icons_path .. "titlebar/close_focus.png"
--
-- theme.titlebar_minimize_button_normal = icons_path .. "titlebar/minimize_normal.png"
-- theme.titlebar_minimize_button_focus = icons_path .. "titlebar/minimize_focus.png"
--
-- theme.titlebar_ontop_button_normal_inactive = icons_path .. "titlebar/ontop_normal_inactive.png"
-- theme.titlebar_ontop_button_focus_inactive = icons_path .. "titlebar/ontop_focus_inactive.png"
-- theme.titlebar_ontop_button_normal_active = icons_path .. "titlebar/ontop_normal_active.png"
-- theme.titlebar_ontop_button_focus_active = icons_path .. "titlebar/ontop_focus_active.png"
--
-- theme.titlebar_sticky_button_normal_inactive = icons_path .. "titlebar/sticky_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_inactive = icons_path .. "titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_active = icons_path .. "titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_active = icons_path .. "titlebar/sticky_focus_active.png"
--
-- theme.titlebar_floating_button_normal_inactive = icons_path .. "titlebar/floating_normal_inactive.png"
-- theme.titlebar_floating_button_focus_inactive = icons_path .. "titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_active = icons_path .. "titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active = icons_path .. "titlebar/floating_focus_active.png"
--
-- theme.titlebar_maximized_button_normal_inactive = icons_path .. "titlebar/maximized_normal_inactive.png"
-- theme.titlebar_maximized_button_focus_inactive = icons_path .. "titlebar/maximized_focus_inactive.png"
-- theme.titlebar_maximized_button_normal_active = icons_path .. "titlebar/maximized_normal_active.png"
-- theme.titlebar_maximized_button_focus_active = icons_path .. "titlebar/maximized_focus_active.png"

theme.wallpaper = icons_path .. "background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = icons_path .. "layouts/fairhw.png"
theme.layout_fairv = icons_path .. "layouts/fairvw.png"
theme.layout_floating = icons_path .. "layouts/floatingw.png"
theme.layout_magnifier = icons_path .. "layouts/magnifierw.png"
theme.layout_max = icons_path .. "layouts/maxw.png"
theme.layout_fullscreen = icons_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = icons_path .. "layouts/tilebottomw.png"
theme.layout_tileleft = icons_path .. "layouts/tileleftw.png"
theme.layout_tile = icons_path .. "layouts/tilew.png"
theme.layout_tiletop = icons_path .. "layouts/tiletopw.png"
theme.layout_spiral = icons_path .. "layouts/spiralw.png"
theme.layout_dwindle = icons_path .. "layouts/dwindlew.png"
theme.layout_cornernw = icons_path .. "layouts/cornernww.png"
theme.layout_cornerne = icons_path .. "layouts/cornernew.png"
theme.layout_cornersw = icons_path .. "layouts/cornersww.png"
theme.layout_cornerse = icons_path .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Papirus-Dark"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
