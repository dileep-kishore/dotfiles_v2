local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    f = {
        name = "Files",
        e = { ":Xplr<CR>", "Open Xplr" },
        f = { ":Telescope find_files theme=dropdown<CR>", "Find files" },
        g = { ":Telescope git_files theme=dropdown<CR>", "Git files" },
        F = { ":Telescope find_files theme=dropdown<CR>", "Find files" },
        b = { ":Telescope buffers theme=dropdown<CR>", "Select buffers" },
        d = { ":Telescope fd theme=dropdown<CR>", "Find files (fd)" },
        m = { ":Telescope media_files<CR>", "Media files" },
        s = {
            ":Telescope current_buffer_fuzzy_find theme=dropdown<CR>",
            "Search current buffer",
        },
        r = { "<cmd>lua require('spectre').open_file_search()<cr>", "Spectre search and replace (file)" },
        R = { "<cmd>lua require('spectre').open()<cr>", "Spectre search and replace (project)" },
        z = { ":ZkNotes<CR>", "Search notes (ZK)" },
    },

    g = {
        name = "Git",
        a = { "<cmd>Gwrite<cr>", "Git add" },
        c = { "<cmd>Git commit<cr>", "Git commit" },
        g = { "<cmd>Neogit<CR>", "Neogit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status theme=dropdown<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches theme=dropdown<cr>", "Checkout branch" },
        C = { "<cmd>Telescope git_commits theme=dropdown<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        h = { "<cmd>DiffviewFileHistory<cr>", "View file history" },
        D = { "<cmd>DiffviewOpen<cr>", "View diffs of all modified files" },
    },

    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
            "<cmd>Telescope lsp_document_diagnostics theme=dropdown<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics theme=dropdown<cr>",
            "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Mason info" },
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols theme=dropdown<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols theme=dropdown<cr>",
            "Workspace Symbols",
        },
    },

    s = {
        name = "Search",
        g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        p = { "<cmd>Telescope projects<cr>", "Projects" },
        j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
        h = { "<cmd>Telescope heading<cr>", "Heading" },
        s = { "<cmd>Telescope symbols<cr>", "Symbols" },
        c = { "<cmd>Telescope neoclip<cr>", "Colorscheme" },
        C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { ":Telescope frecency theme=dropdown<CR>", "Frequent files" },
        t = { "<cmd>TodoTelescope<cr>", "Search todos" },
    },

    h = {
        name = "Search help",
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        o = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        t = { "<cmd>TodoQuickFix<cr>", "Open TODOs in quickfix" },
    },

    t = {
        name = "Terminal",
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        t = { "<cmd>lua _BTOP_TOGGLE()<cr>", "btop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },

    n = {
        name = "Zk",
        n = { "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "New note" },
        o = { "<Cmd>ZkNotes<CR>", "Search notes" },
        t = { "<Cmd>ZkTags<CR>", "Search tags" },
        f = { "<Cmd>ZkNotes { match = vim.fn.input('Search: ') }<CR>", "Search notes with query" },
        b = { "<Cmd>ZkBacklinks<CR>", "Search backlinks" },
        l = { "<Cmd>Zklinks<CR>", "Search links" },
    },

    d = {
        name = "Trouble",
        x = { "<cmd>Trouble<cr>", "Trouble" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble workspace_diagnostics" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble document_diagnostics" },
        l = { "<cmd>Trouble loclist<cr>", "Trouble loclist" },
        q = { "<cmd>Trouble quickfix<cr>", "Trouble quickfix" },
        t = { "<cmd>TodoTrouble<cr>", "Trouble todos" },
    },

    c = {
        name = "Code execution",
        t = { "<cmd>Ultest<cr>", "Run Ultest" },
        s = { "<cmd>SnipRun<cr>", "Run SnipRun" },
        p = { "<cmd>Glow<cr>", "Run Glow" },
    },

    w = {
        name = "Swap",
        c = { "<cmd>ISwapWith<cr>", "Swap current" },
        s = { "<cmd>ISwap<cr>", "Swap interactive" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
