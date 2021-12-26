local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"
require "awful.hotkeys_popup.keys"
local menubar = require "menubar"

local apps = require "config.apps"
local mod = require "bindings.mod"
local widgets = require "widgets"
local modules = require "modules"

menubar.utils.terminal = apps.terminal

---- general awesome keys
awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { mod.super },
        key = "s",
        description = "show help",
        group = "awesome",
        on_press = hotkeys_popup.show_help,
    },
    awful.key {
        modifiers = { mod.super },
        key = "w",
        description = "show main menu",
        group = "awesome",
        on_press = function()
            widgets.mainmenu:show()
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "r",
        description = "reload awesome",
        group = "awesome",
        on_press = awesome.restart,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "x",
        description = "quit awesome",
        group = "awesome",
        on_press = awesome.quit,
    },
    awful.key {
        modifiers = { mod.super },
        key = "=",
        description = "toggle systray",
        group = "awesoome",
        on_press = function()
            awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
        end,
    },
    awful.key {
        modifiers = { mod.super },
        key = "Return",
        description = "open a terminal",
        group = "launcher",
        on_press = function()
            awful.spawn(apps.terminal)
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "Return",
        description = "Rofi launcher",
        group = "launcher",
        on_press = function()
            awful.spawn.with_shell "bash ~/.config/rofi/launcher.sh"
        end,
    },
    awful.key {
        modifiers = { mod.alt, mod.shift },
        key = "Left",
        description = "Wacom on left screen",
        group = "launcher",
        on_press = function()
            awful.spawn.with_shell "~/.dotfiles/bin/wacom_config.sh 'left'"
        end,
    },
    awful.key {
        modifiers = { mod.alt, mod.shift },
        key = "Right",
        description = "Wacom on right screen",
        group = "launcher",
        on_press = function()
            awful.spawn.with_shell "~/.dotfiles/bin/wacom_config.sh 'right'"
        end,
    },
    awful.key {
        modifiers = { mod.alt, mod.shift },
        key = "t",
        description = "Open scratcpad",
        group = "launcher",
        on_press = function()
            modules.term_scratch:toggle()
        end,
    },
}

---- tag related keybindings
awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { mod.super },
        key = "Left",
        description = "view previous",
        group = "tag",
        on_press = awful.tag.viewprev,
    },
    awful.key {
        modifiers = { mod.super },
        key = "Right",
        description = "view next",
        group = "tag",
        on_press = awful.tag.viewnext,
    },
    awful.key {
        modifiers = { mod.super },
        key = "Escape",
        description = "go back",
        group = "tag",
        on_press = awful.tag.history.restore,
    },
}

---- focus related keybindings
awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { mod.super },
        key = "Tab",
        description = "go back",
        group = "client",
        on_press = function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.ctrl },
        key = "h",
        description = "focus the prev screen",
        group = "screen",
        on_press = function()
            awful.screen.focus_relative(-1)
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.ctrl },
        key = "l",
        description = "focus the next screen",
        group = "screen",
        on_press = function()
            awful.screen.focus_relative(1)
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.ctrl },
        key = "n",
        description = "restore minimized",
        group = "client",
        on_press = function()
            local c = awful.client.restore()
            if c then
                c:active { raise = true, context = "key.unminimize" }
            end
        end,
    },
}

-- layout related keybindings
awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "j",
        description = "swap with next client by index",
        group = "client",
        on_press = function()
            awful.client.swap.byidx(1)
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "k",
        description = "swap with previous client by index",
        group = "client",
        on_press = function()
            awful.client.swap.byidx(-1)
        end,
    },
    awful.key {
        modifiers = { mod.super },
        key = "u",
        description = "jump to urgent client",
        group = "client",
        on_press = awful.client.urgent.jumpto,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "l",
        description = "increase master width factor",
        group = "layout",
        on_press = function()
            awful.tag.incmwfact(0.05)
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "h",
        description = "decrease master width factor",
        group = "layout",
        on_press = function()
            awful.tag.incmwfact(-0.05)
        end,
    },
    awful.key {
        modifiers = { mod.super },
        key = "space",
        description = "select next",
        group = "layout",
        on_press = function()
            awful.layout.inc(1)
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        key = "space",
        description = "select previous",
        group = "layout",
        on_press = function()
            awful.layout.inc(-1)
        end,
    },
}

awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { mod.super },
        keygroup = "numrow",
        description = "only view tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only(tag)
            end
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.ctrl },
        keygroup = "numrow",
        description = "toggle tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        keygroup = "numrow",
        description = "move focused client to tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.ctrl, mod.shift },
        keygroup = "numrow",
        description = "toggle focused client on tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers = { mod.alt, mod.shift },
        keygroup = "numrow",
        description = "select layout directly",
        group = "layout",
        on_press = function(index)
            local tag = awful.screen.focused().selected_tag
            if tag then
                tag.layout = tag.layouts[index] or tag.layout
            end
        end,
    },
}
