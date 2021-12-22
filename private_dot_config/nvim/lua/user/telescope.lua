local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

----- Keymaps
--Files
keymap("n", "<Leader>ff", ":Telescope frecency theme=dropdown<CR>", opts)
keymap("n", "<Leader>fg", ":Telescope git_files theme=dropdown<CR>", opts)
keymap("n", "<Leader>fb", ":Telescope buffers theme=dropdown<CR>", opts)
keymap("n", "<Leader>fd", ":Telescope fd theme=dropdown<CR>", opts)
keymap("n", "<Leader>fs", ":Telescope current_buffer_fuzzy_find theme=dropdown<CR>", opts)
-- Search
keymap("n", "<Leader>sg", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>sm", ":Telescope marks<CR>", opts)
keymap("n", "<Leader>sr", ":Telescope registers<CR>", opts)
keymap("n", "<Leader>sj", ":Telescope jumplist<CR>", opts)
keymap("n", "<Leader>sh", ":Telescope heading<CR>", opts)
keymap("n", "<Leader>ss", ":Telescope symbols<CR>", opts)
keymap("n", "<Leader>sp", ":Telescope projects<CR>", opts)
-- Help
keymap("n", "<Leader>hm", ":Telescope man_pages<CR>", opts)
keymap("n", "<Leader>ho", ":Telescope vim_options<CR>", opts)
keymap("n", "<Leader>hk", ":Telescope keymaps<CR>", opts)
-- Git stuff
keymap("n", "<Leader>gc", ":Telescope git_commits theme=dropdown<CR>", opts)
keymap("n", "<Leader>gb", ":Telescope git_branches theme=dropdown<CR>", opts)
keymap("n", "<Leader>gb", ":Telescope git_branches theme=dropdown<CR>", opts)
-- Code stuff
keymap("n", "<Leader>ca", ":Telescope lsp_code_actions<CR>", opts)
keymap("n", "<Leader>cd", ":Telescope diagnostics<CR>", opts)

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-j>"] = actions.cycle_history_next,
                ["<C-k>"] = actions.cycle_history_prev,

                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
}
