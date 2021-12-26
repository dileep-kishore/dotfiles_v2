local awful = require "awful"
local ruled = require "ruled"

ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id = "global",
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    }

    -- Floating clients.
    ruled.client.append_rule {
        id = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "Sxiv",
                "Tor Browser",
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
                "Barrier",
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true },
    }

    -- TODO: Fix screen for laptop

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id = "titlebars",
        rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false },
    }

    -- Set Brave to always map on the tag named '2' on screen 1.
    ruled.client.append_rule {
        rule = { class = "Brave-browser" },
        properties = { screen = 1, tag = "1" },
    }

    -- Set telegram to always appear on the tag named '5' on screen 2
    ruled.client.append_rule {
        rule = { class = "TelegramDesktop" },
        properties = { screen = 2, tag = "5" },
    }

    -- Set skype to always appear on the tag named '5' on screen 2
    ruled.client.append_rule {
        rule = { class = "Skype" },
        properties = { screen = 2, tag = "5" },
    }

    -- Set Signal to always appear on the tag named '5' on screen 2
    ruled.client.append_rule {
        rule = { class = "Signal" },
        properties = { screen = 2, tag = "5" },
    }

    -- Set Zoom to always appear on the tag named '5' on screen 2
    ruled.client.append_rule {
        rule = { class = "zoom" },
        properties = { screen = 2, tag = "5" },
    }

    -- Set Spotify to always appear on the tag named '5' on screen 2
    ruled.client.append_rule {
        rule = { class = "zoom" },
        properties = { screen = 2, tag = "6" },
    }

    -- Set Obsidian to always appear on the tag named '7' on screen 2
    ruled.client.append_rule {
        rule = { class = "obsidian" },
        properties = { screen = 2, tag = "7" },
    }

    -- Set ClickUp to always appear on the tag named '8' on screen 2
    ruled.client.append_rule {
        rule = { class = "ClickUp" },
        properties = { screen = 2, tag = "8" },
    }

    -- Set Zotero to always appear on the tag named '8' on screen 2
    ruled.client.append_rule {
        rule = { class = "Zotero" },
        properties = { screen = 2, tag = "9" },
    }
end)
