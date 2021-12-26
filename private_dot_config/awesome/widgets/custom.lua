local wibox = require "wibox"
local calendar_widget = require "awesome-wm-widgets.calendar-widget.calendar"
local cpu_widget = require "awesome-wm-widgets.cpu-widget.cpu-widget"
local fs_widget = require "awesome-wm-widgets.fs-widget.fs-widget"
local ram_widget = require "awesome-wm-widgets.ram-widget.ram-widget"
local logout_popup = require "awesome-wm-widgets.logout-popup-widget.logout-popup"
local net_speed_widget = require "awesome-wm-widgets.net-speed-widget.net-speed"
local spotify_widget = require "awesome-wm-widgets.spotify-widget.spotify"
local volume_widget = require "awesome-wm-widgets.volume-widget.volume"
local spotify_shell = require "awesome-wm-widgets.spotify-shell.spotify-shell"
local weather_curl_widget = require "awesome-wm-widgets.weather-widget.weather"

local _M = {}

-- Create a textclock widget
-- TODO: Use vicious to create the textclock
_M.mytextclock = wibox.widget.textclock()
local cw = calendar_widget {
    theme = "outrun",
    placement = "top_right",
    radius = 8,
    start_sunday = true,
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

-- Net speed
_M.net_speed_widget = net_speed_widget()

-- Volume widget
_M.volume_widget = volume_widget {
    widget_type = "arc",
}

-- Spotify widget
_M.spotify_widget = spotify_widget {
    -- font = "Lato Medium 12",
    play_icon = "/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg",
    pause_icon = "/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg",
    dim_when_paused = true,
    dim_opacity = 0.5,
    max_length = -1,
    show_tooltip = true,
}
_M.spotify_shell = spotify_shell

-- Weather
_M.weather_widget = weather_curl_widget {
    api_key = "6fdd54d78ad8ebe331fc3126af951827",
    coordinates = { 42.35765, -71.12889 },
    time_format_12h = false,
    units = "imperial",
    both_units_widget = false,
    icons = "VitalyGorbachev",
    icons_extension = ".svg",
    show_hourly_forecast = true,
    show_daily_forecast = true,
}

return _M
