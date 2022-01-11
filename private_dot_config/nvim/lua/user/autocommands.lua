-- autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command "autocmd!"
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command "augroup END"
    end
end

local autocmds = {
    general_settings = {
        { "BufWinEnter", "*", "set formatoptions-=cro" },
        { "FileType", "qf", "set nobuflisted" },
    },
    git = {
        { "FileType", "gitcommit", "setlocal wrap" },
        { "FileType", "gitcommit", "setlocal spell" },
        { "FileType", "NeogitCommitMessage", "setlocal wrap" },
        { "FileType", "NeogitCommitMessage", "setlocal spell" },
    },
    markdown = {
        { "FileType", "markdown", "setlocal wrap" },
        { "FileType", "markdown", "setlocal spell" },
    },
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] },
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" },
    },
    custom_filetypes = {
        { "BufNew,BufNewFile,BufRead", "*.nf", "set filetype=groovy" },
    },
    restore_cursor = {
        { "BufRead", "*", [[call setpos(".", getpos("'\""))]] },
    },
    save_shada = {
        { "VimLeave", "*", "wshada!" },
    },
    resize_windows_proportionally = {
        { "VimResized", "*", "tabdo wincmd =" },
    },
    toggle_search_highlighting = {
        { "InsertEnter", "*", "setlocal nohlsearch" },
    },
    lua_highlight = {
        { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] },
    },
}

nvim_create_augroups(autocmds)

vim.cmd [[
augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
augroup end
]]

-- autocommands END
