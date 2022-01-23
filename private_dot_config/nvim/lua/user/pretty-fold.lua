local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
    return
end

local status_ok, pretty_fold_preview = pcall(require, "pretty-fold.preview")
if not status_ok then
    return
end

pretty_fold.setup {
    fill_char = "━",
    sections = {
        left = {
            "content",
        },
        right = {
            "┫ ",
            "number_of_folded_lines",
            ": ",
            "percentage",
            " ┣━━",
            function(config)
                return config.fill_char:rep(3)
            end,
        },
    },
}

pretty_fold_preview.setup {
    key = "h",
}
