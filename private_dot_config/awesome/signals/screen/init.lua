local awful = require "awful"
local beautiful = require "beautiful"
local wibox = require "wibox"

local vars = require "config.vars"
local widgets = require "widgets"

-- NOTE: We set the wallaper using nitrogen,
-- because we don't want to bundle those with dotfiles

-- screen.connect_signal("request::wallpaper", function(s)
--     awful.wallpaper {
--         screen = s,
--         widget = {
--             {
--                 image = beautiful.wallpaper,
--                 upscale = true,
--                 downscale = true,
--                 widget = wibox.widget.imagebox,
--             },
--             valign = "center",
--             halign = "center",
--             tiled = false,
--             widget = wibox.container.tile,
--         },
--     }
-- end)

screen.connect_signal("request::desktop_decoration", function(s)
    -- awful.tag(vars.tags, s, awful.layout.layouts[1])
    for i = 1, 9, 1 do
        awful.tag.add(i, {
            icon = "/home/dileep/.config/awesome/theme/icons/taglist/" .. i .. ".svg",
            icon_only = true,
            layout = awful.layout.suit.tile,
            screen = s,
            selected = i == 1,
        })
    end
    -- s.promptbox = widgets.create_promptbox()
    s.layoutbox = widgets.create_layoutbox(s)
    -- s.leftpanel = widgets.create_leftpanel(s)
    s.taglist = widgets.create_taglist(s)
    s.tasklist = widgets.create_tasklist(s)
    s.wibox = widgets.create_wibox(s)
end)
