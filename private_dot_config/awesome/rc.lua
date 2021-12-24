-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, "luarocks.loader")

-- load theme
local beautiful = require "beautiful"
local gears = require "gears"
local awful = require "awful"
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- load key and mouse bindings
require "bindings"

-- load rules
require "rules"

-- load signals
require "signals"

-- load modules
require "modules"

-- autostart
-- NOTE: We create an additional file because not all processes work properly with spawn.once
-- This is especially the case with daemons (like syncthing)
awful.spawn.with_shell "bash ~/.config/awesome/autorun.sh"
