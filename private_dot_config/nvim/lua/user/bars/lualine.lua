local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local gps_ok, gps = pcall(require, "nvim-gps")
if not gps_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local mode = {
    "mode",
}

local filename = {
    "filename",
    file_status = false,
    path = 1,
    cond = hide_in_width,
}

local function modified()
    if vim.bo.modified then
        return " "
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return " "
    end
    return ""
end

local modified_section = {
    modified,
    color = { fg = "#ca1243" },
}

local filetype = {
    "filetype",
    icons_enabled = true,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local function get_gps()
    local fname = vim.api.nvim_buf_get_name(0):match "^.+/(.+)$"
    if gps.is_available() == true then
        local location = gps.get_location()
        if location == "" then
            return fname
        else
            return location
        end
    else
        return fname
    end
end

local location = {
    "location",
}

-- cool function for progress
local progress = function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "/" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { branch, get_gps },
        lualine_b = { mode },
        lualine_c = { diagnostics, modified_section },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = { diff, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { progress },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename, modified },
        lualine_x = { location },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
