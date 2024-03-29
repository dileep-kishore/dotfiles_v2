---------------------------
-- icons awesome theme --
---------------------------

local theme_assets = require "beautiful.theme_assets"
local xresources = require "beautiful.xresources"
local gears = require "gears"
local rnotification = require "ruled.notification"
local dpi = xresources.apply_dpi

local themes_path = os.getenv "HOME" .. "/.config/awesome/theme/"

local theme = {}

theme.name = "catppuccin"
theme.font = "Lato Medium 12"
theme.title_font = "Lato Medium 14"

theme.bg_normal = "#1F1F2800"
theme.bg_focus = "#1F1F28"
theme.bg_urgent = "#f38ba8"
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#ffffff"
theme.fg_focus = "#cba6f7"
theme.fg_urgent = "#f38ba8"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(4)
theme.border_width = dpi(4)
theme.border_normal = "#1F1F28"
theme.border_focus = "#1F1F28"
theme.border_marked = "#1F1F28"

-- more colors
theme.first = "#5b3e78"
theme.second = "#344b78"
theme.third = "#793342"
theme.fourth = "#050200"

-- There are other variable sets
-- overriding the icons one when
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

-- Taglist
theme.taglist_bg_empty = "#cba6f7"
theme.taglist_bg_occupied = "#b4befe"
theme.taglist_bg_urgent = theme.bg_urgent
theme.taglist_bg_focus = "#89b4fa"

-- Tasklist
theme.tasklist_disable_icon = false
theme.taslist_plain_task_name = false
theme.tasklist_font = "Lato Medium 12"
theme.tasklist_bg_normal = "#cba6f7"
theme.tasklist_bg_focus = "#89b4fa"
theme.tasklist_bg_urgent = theme.bg_urgent
theme.tasklist_fg_focus = theme.border_normal
theme.tasklist_fg_urgent = theme.border_normal
theme.tasklist_fg_normal = theme.border_normal

-- Tooltips
theme.tooltip_bg = "#232323"
--theme.tooltip_border_color = '#232323'
theme.tooltip_border_width = 0
theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(6))
end

-- Generate taglist squares:
-- theme.taglist_squares_sel = themes_path .. "icons/taglist/square_sel.png"
-- theme.taglist_squares_unsel = themes_path .. "icons/taglist/square_unsel.png"
-- theme.taglist_squares_sel = gears.surface.load_from_shape(10, 50, gears.shape.rectangle, "#43242B")
--[[ theme.taglist_squares_unsel = gears.surface.load_from_shape(10, 50, gears.shape.circle, "#ffffff") ]]
theme.taglist_spacing = 2

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "icons/submenu.png"
theme.menu_height = dpi(22)
theme.menu_width = dpi(160)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "icons/layouts/fairh.png"
theme.layout_fairv = themes_path .. "icons/layouts/fairv.png"
theme.layout_floating = themes_path .. "icons/layouts/floating.png"
theme.layout_magnifier = themes_path .. "icons/layouts/magnifier.png"
theme.layout_max = themes_path .. "icons/layouts/max.png"
theme.layout_fullscreen = themes_path .. "icons/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path .. "icons/layouts/tilebottom.png"
theme.layout_tileleft = themes_path .. "icons/layouts/tileleft.png"
theme.layout_tile = themes_path .. "icons/layouts/tile.png"
theme.layout_tiletop = themes_path .. "icons/layouts/tiletop.png"
theme.layout_spiral = themes_path .. "icons/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "icons/layouts/dwindle.png"
theme.layout_mstab = themes_path .. "icons/layouts/mstab.png"
theme.layout_deck = themes_path .. "icons/layouts/deck.png"
theme.layout_centered = themes_path .. "icons/layouts/centered.png"

---- for tabbar
theme.tabbar_style = "modern"
theme.tag_preview_client_border_width = 0
theme.tag_preview_widget_border_color = "#89b4fa" -- The border color of the widget
theme.task_preview_widget_border_color = "#cba6f7" -- The border color of the widget

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Papirus-Dark"

-- Set different colors for urgent notifications.
-- rnotification.connect_signal("request::rules", function()
--     rnotification.append_rule {
--         rule = { urgency = "critical" },
--         properties = { bg = "#ff0000", fg = "#ffffff" },
--     }
-- end)

return theme
