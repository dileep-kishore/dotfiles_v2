local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files theme=dropdown<CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert theme=dropdown<CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects theme=dropdown<CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles theme=dropdown<CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep theme=dropdown<CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.dotfiles/private_dot_config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
    -- NOTE: requires the cowfortune package to work
    local handle = io.popen "fortune | cowsay"
    local fortune = handle:read "*a"
    handle:close()
    return fortune
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
