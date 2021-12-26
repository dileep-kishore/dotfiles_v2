local _M = {}

local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"
local beautiful = require "beautiful"
local wibox = require "wibox"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local apps = require "config.apps"
local mod = require "bindings.mod"

_M.awesomemenu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
    },
    { "manual", apps.manual_cmd },
    { "edit config", apps.editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", awesome.quit },
}

_M.mainmenu = awful.menu {
    items = {
        { "awesome", _M.awesomemenu, beautiful.awesome_icon },
        { "open terminal", apps.terminal },
    },
}

_M.launcher = awful.widget.launcher {
    image = beautiful.awesome_icon,
    menu = _M.mainmenu,
}

_M.keyboardlayout = awful.widget.keyboardlayout()
_M.textclock = wibox.widget.textclock()

function _M.right_tri(cr, width, height, degree)
    cr:move_to(width, 0)
    cr:line_to(0, height)
    cr:line_to(width, height)
    cr:close_path()
end

function _M.left_tri(cr, width, height, degree)
    cr:move_to(0, 0)
    cr:line_to(0, height)
    cr:line_to(width, height)
    cr:close_path()
end

function _M.create_promptbox()
    return awful.widget.prompt()
end

function _M.create_layoutbox(s)
    return awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button {
                modifiers = {},
                button = 1,
                on_press = function()
                    awful.layout.inc(1)
                end,
            },
            awful.button {
                modifiers = {},
                button = 3,
                on_press = function()
                    awful.layout.inc(-1)
                end,
            },
            awful.button {
                modifiers = {},
                button = 4,
                on_press = function()
                    awful.layout.inc(-1)
                end,
            },
            awful.button {
                modifiers = {},
                button = 5,
                on_press = function()
                    awful.layout.inc(1)
                end,
            },
        },
    }
end

function _M.create_taglist(s)
    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.rectangle,
        },
        layout = {
            spacing = 2,
            spacing_widget = {
                color = "#1a1b26",
                shape = gears.shape.rectangle,
                widget = wibox.widget.separator,
            },
            layout = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = "index_role",
                                widget = wibox.widget.imagebox,
                            },
                            margins = 0,
                            widget = wibox.container.margin,
                        },
                        widget = wibox.container.background,
                    },
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget = wibox.container.margin,
                    },
                    layout = wibox.layout.align.horizontal,
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects)
                self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
                self:connect_signal("mouse::enter", function()
                    -- BLING: Only show widget when there are clients in the tag
                    if #c3:clients() > 0 then
                        -- BLING: Update the widget with the new tag
                        awesome.emit_signal("bling::tag_preview::update", c3)
                        -- BLING: Show the widget
                        awesome.emit_signal("bling::tag_preview::visibility", s, true)
                    end

                    if self.bg ~= beautiful.bg_urgent then
                        self.backup = self.bg
                        self.has_backup = true
                    end
                    self.bg = beautiful.bg_urgent
                end)
                self:connect_signal("mouse::leave", function()
                    -- BLING: Turn the widget off
                    awesome.emit_signal("bling::tag_preview::visibility", s, false)

                    if self.has_backup then
                        self.bg = self.backup
                    end
                end)
            end,
            update_callback = function(self, c3, index, objects)
                self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
            end,
        },
        buttons = {
            awful.button {
                modifiers = {},
                button = 1,
                on_press = function(t)
                    t:view_only()
                end,
            },
            awful.button {
                modifiers = { mod.super },
                button = 1,
                on_press = function(t)
                    if client.focus then
                        client.focus:move_to_tag(t)
                    end
                end,
            },
            awful.button {
                modifiers = {},
                button = 3,
                on_press = awful.tag.viewtoggle,
            },
            awful.button {
                modifiers = { mod.super },
                button = 3,
                on_press = function(t)
                    if client.focus then
                        client.focus:toggle_tag(t)
                    end
                end,
            },
            awful.button {
                modifiers = {},
                button = 4,
                on_press = function(t)
                    awful.tag.viewprev(t.screen)
                end,
            },
            awful.button {
                modifiers = {},
                button = 5,
                on_press = function(t)
                    awful.tag.viewnext(t.screen)
                end,
            },
        },
        -- list_update,
    }
end

local function mysep(color, shape)
    return wibox.widget {
        shape = shape,
        color = color,
        border_width = 0,
        forced_width = 18,
        widget = wibox.widget.separator,
    }
end

function _M.create_tasklist(s)
    return awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,

        style = {
            shape = gears.shape.rounded_rect,
        },
        layout = {
            spacing = 10,
            spacing_widget = {
                {
                    forced_width = 5,
                    shape = gears.shape.circle,
                    widget = wibox.widget.separator,
                },
                valign = "center",
                halign = "center",
                widget = wibox.container.place,
            },
            layout = wibox.layout.flex.horizontal,
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                {
                    {
                        {
                            id = "clienticon",
                            widget = awful.widget.clienticon,
                        },
                        margins = 2,
                        widget = wibox.container.margin,
                    },
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.align.horizontal,
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin,
            },
            forced_width = dpi(200),
            id = "background_role",
            widget = wibox.container.background,
        },

        buttons = {
            awful.button {
                modifiers = {},
                button = 1,
                on_press = function(c)
                    c:activate { context = "tasklist", action = "toggle_minimization" }
                end,
            },
            awful.button {
                modifiers = {},
                button = 3,
                on_press = function()
                    awful.menu.client_list { theme = { width = 250 } }
                end,
            },
            awful.button {
                modifiers = {},
                button = 4,
                on_press = function()
                    awful.client.focus.byidx(-1)
                end,
            },
            awful.button {
                modifiers = {},
                button = 5,
                on_press = function()
                    awful.client.focus.byidx(1)
                end,
            },
        },
    }
end

function _M.create_wibox(s)
    return awful.wibar {
        screen = s,
        position = "top",
        -- bg = "#00000000",
        bg = "#1a1b26EE",
        shape = gears.shape.rounded_bar,
        border_width = dpi(5),
        widget = {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            -- left widgets
            {
                layout = wibox.layout.fixed.horizontal,
                -- _M.launcher,
                s.tasklist,
                -- s.promptbox,
            },
            -- middle widgets
            {
                layout = wibox.layout.align.horizontal,
                s.taglist,
            },
            -- right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                wibox.container.background(mysep(beautiful.fg_focus, _M.right_tri), beautiful.bg_normal),
                _M.keyboardlayout,
                wibox.container.background(mysep(beautiful.fg_focus, _M.right_tri), beautiful.bg_normal),
                wibox.widget.systray(),
                wibox.container.background(mysep(beautiful.fg_focus, _M.right_tri), beautiful.bg_normal),
                _M.textclock,
                wibox.container.background(mysep(beautiful.fg_focus, _M.right_tri), beautiful.bg_normal),
                s.layoutbox,
            },
        },
    }
end

return _M
