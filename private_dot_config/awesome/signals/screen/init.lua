local awful = require "awful"
local beautiful = require "beautiful"
local wibox = require "wibox"

local vars = require "config.vars"
local widgets = require "widgets"

screen.connect_signal("request::desktop_decoration", function(s)
    -- awful.tag(vars.tags, s, awful.layout.layouts[1])
    for i = 1, 9, 1 do
        awful.tag.add(i, {
            icon = os.getenv "HOME" .. "/.config/awesome/theme/icons/taglist/" .. i .. ".svg",
            icon_only = true,
            layout = awful.layout.suit.tile,
            screen = s,
            selected = i == 1,
        })
    end
    -- s.promptbox = widgets.create_promptbox()
    s.layoutbox = widgets.create_layoutbox(s)
    s.systray = wibox.widget.systray()
    s.systray.visible = false
    s.taglist = widgets.create_taglist(s)
    s.tasklist = widgets.create_tasklist(s)
    s.wibox = widgets.create_wibox(s)
end)
