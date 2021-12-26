local wibox = require "wibox"
local calendar_widget = require "modules.awesome-wm-widgets.calendar-widget.calendar"
local cpu_widget = require "modules.awesome-wm-widgets.cpu-widget.cpu-widget"

local _M = {}

-- Create a textclock widget
-- TODO: Use vicious to edit the textclock
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

_M.cpu_widget = cpu_widget {
    width = 70,
    step_width = 2,
    step_spacing = 0,
    color = "#434c5e",
}

return _M
