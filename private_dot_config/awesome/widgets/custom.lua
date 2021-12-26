local wibox = require "wibox"
local calendar_widget = require "awesome-wm-widgets.calendar-widget.calendar"
local cpu_widget = require "awesome-wm-widgets.cpu-widget.cpu-widget"
local fs_widget = require "awesome-wm-widgets.fs-widget.fs-widget"
local ram_widget = require "awesome-wm-widgets.ram-widget.ram-widget"
local logout_popup = require "awesome-wm-widgets.logout-popup-widget.logout-popup"

local _M = {}

-- Create a textclock widget
-- TODO: Use vicious to create the textclock
_M.mytextclock = wibox.widget.textclock()
local cw = calendar_widget {
    theme = "outrun",
    placement = "top_right",
    radius = 8,
}
_M.mytextclock:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then
        cw.toggle()
    end
end)

-- Create a cpu widget
_M.cpu_widget = cpu_widget {
    width = 70,
    step_width = 2,
    step_spacing = 0,
    color = "#434c5e",
}

-- Create a filesystem widget
_M.fs_widget = fs_widget { mounts = { "/", "/media/crucial", "/media/seagate" } }

-- Create a RAM widget
_M.ram_widget = ram_widget()

-- Create logout menu widget
_M.logout_menu_widget = logout_popup.widget {
    bg_color = "#261447",
    accent_color = "#ff4365",
    text_color = "#f706cf",
    icon_size = 40,
    icon_margin = 16,
}

return _M
