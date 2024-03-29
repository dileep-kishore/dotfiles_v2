local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

---- Plugins ----
return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "rcarriga/nvim-notify"

    ---- Treesitter related
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow" -- Rainbow paranthesis
    use {
        "JoosepAlviste/nvim-ts-context-commentstring", -- For context dependent commenting
    }
    use {
        "romgrk/nvim-treesitter-context", -- Shows context of current position using floatin window
        after = "nvim-treesitter",
        config = function()
            require("treesitter-context").setup()
        end,
    }
    -- Quick fix window
    use { "kevinhwang91/nvim-bqf", ft = "qf" }
    -- file types
    use "nathom/filetype.nvim"

    ---- Telescope related
    use "nvim-telescope/telescope.nvim"
    use {
        "nvim-telescope/telescope-fzf-native.nvim", -- Native C sorting for better performance
        run = "make",
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension "fzf"
        end,
    }
    use {
        "nvim-telescope/telescope-frecency.nvim",
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension "frecency"
        end,
        requires = { "tami5/sqlite.lua" },
    }
    -- Search headings
    use {
        "crispgm/telescope-heading.nvim",
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension "heading"
        end,
    }
    -- Symbols
    use "nvim-telescope/telescope-symbols.nvim"
    -- Project management
    use {
        "ahmedkhalf/project.nvim", -- Superior project management
        after = "telescope.nvim",
        config = function()
            require("project_nvim").setup {}
            require("telescope").load_extension "projects"
        end,
    }
    -- Search media
    use {
        "nvim-telescope/telescope-media-files.nvim",
        after = "telescope.nvim",
        config = function()
            require("telescope").load_extension "media_files"
        end,
    }

    ---- LSP related
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        after = "mason.nvim",
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        after = { "mason.nvim", "nvim-lspconfig" },
    }
    use "tamago324/nlsp-settings.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "RRethy/vim-illuminate"
    use { "ray-x/navigator.lua", requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" } }
    use {
        "rmagatti/goto-preview", -- Preview goto definition in floating window
        after = "nvim-lspconfig",
        config = function()
            require("goto-preview").setup {}
        end,
    }
    -- completions
    use {
        "ray-x/lsp_signature.nvim", -- Show function signatures
        after = "nvim-lspconfig",
        config = function()
            require("lsp_signature").setup()
        end,
    }
    -- Diagonostics
    use {
        "folke/trouble.nvim", -- A pretty list for showing diagnostics
        opt = true,
        after = "nvim-lspconfig",
        cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefersh" },
        config = function()
            require("trouble").setup()
        end,
    }
    use "antoinemadec/FixCursorHold.nvim"
    -- Code navigation
    use {
        "simrat39/symbols-outline.nvim", -- A tree like view for navigating symbols
        after = "nvim-lspconfig",
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
        config = function()
            require("symbols-outline").setup()
        end,
    }
    -- Spell check
    use {
        "lewis6991/spellsitter.nvim", -- Speechecker
        after = "nvim-treesitter",
        config = function()
            require("spellsitter").setup()
        end,
    }

    ---- Completions
    use "hrsh7th/nvim-cmp"
    use {
        "hrsh7th/cmp-buffer", -- buffer completions
    }
    use {
        "hrsh7th/cmp-path", -- path completions
    }
    use {
        "hrsh7th/cmp-cmdline", -- cmdline completions
        opt = true,
        event = "CmdlineEnter",
    }
    use {
        "hrsh7th/cmp-nvim-lsp", -- lsp completions
    }
    use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" } -- tabnine
    use {
        "petertriho/cmp-git", -- git issue/pull request completions
        opt = true,
        ft = "gitcommit",
        config = function()
            require("cmp_git").setup()
        end,
    }
    -- icons
    use "onsails/lspkind-nvim" -- Icons for completions
    -- snippets
    use "L3MON4D3/LuaSnip"
    use {
        "saadparwaiz1/cmp_luasnip", -- snippet completions
    }
    use "rafamadriz/friendly-snippets"
    -- documentation
    use {
        "kkoomen/vim-doge", -- generates documentation skeletons
        run = ":call doge#install()",
        opt = true,
        cmd = { "DogeGenerate", "DogeCreateDocStandard" },
    }
    -- Brackets
    use "windwp/nvim-autopairs"

    ---- Keybindings
    use "folke/which-key.nvim"
    use { "jdhao/better-escape.vim", event = "InsertEnter" }
    -- Commenting
    use {
        "numToStr/Comment.nvim", -- Smart powerful commenting framework
    }

    ---- Git
    use "tpope/vim-fugitive" -- The premier vim plugin for Git
    use "TimUntersberger/neogit"
    use {
        "pwntester/octo.nvim", -- Edit GitHub issues and pull requests
        config = function()
            require("octo").setup()
        end,
        cmd = { "Octo" },
    }
    use "lewis6991/gitsigns.nvim"
    -- git diffs
    use {
        "sindrets/diffview.nvim", -- Diffview functionality similar to vscode
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    }

    ---- Motions, windows and navigation
    use {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end,
    }
    use "mfussenegger/nvim-ts-hint-textobject"
    use "edluffy/specs.nvim"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
    use "tpope/vim-surround"
    use "michaeljsmith/vim-indent-object"
    use "wellle/targets.vim"
    use {
        "mizlan/iswap.nvim", -- Interactively swap treesitter elements
        opt = true,
        cmd = { "ISwap", "ISwapWith" },
    }
    -- Search
    use "tpope/vim-abolish"
    use "windwp/nvim-spectre"
    use {
        "kevinhwang91/nvim-hlslens",
    }
    -- Scrollbar
    use "petertriho/nvim-scrollbar"
    -- Peek
    use {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end,
    }
    -- Marks
    use {
        "chentoast/marks.nvim",
        config = function()
            require("marks").setup {}
        end,
    }
    -- Window management
    use "famiu/bufdelete.nvim"
    -- Terminals
    use "akinsho/toggleterm.nvim"
    -- TMUX Navigation
    use {
        "numToStr/Navigator.nvim", -- Smoothly navigate between splits and panes
        config = function()
            require("Navigator").setup()
        end,
        commit = "6bfcf7d",
    }
    ---- Language specific
    -- LaTeX
    use {
        "lervag/vimtex",
        opt = true,
        ft = { "tex" },
    }
    -- Python
    use {
        "untitled-ai/jupyter_ascending.vim", -- Edit jupytext file and keep it in syc with .ipynb
        opt = true,
        ft = { "python" },
    }

    ---- Themes and eye candy
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }
    -- Smooth buffer change when opening quick et al.
    use {
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end,
    }
    -- Highlight current mode in cursorline
    use {
        "mvllow/modes.nvim",
        event = "BufRead",
        config = function()
            vim.opt.cursorline = true
            require("modes").setup()
        end,
    }
    -- Smooth scrolling
    use {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
            require("telescope").load_extension "neoclip"
        end,
    }
    -- Better folding
    use {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup()
        end,
    }
    use {
        "anuvyklack/fold-preview.nvim",
        requires = "anuvyklack/keymap-amend.nvim",
        config = function()
            require("fold-preview").setup()
        end,
    }
    use "tpope/vim-sleuth" -- Automatically adjust shiftwidth and expandtab
    -- Highlights
    -- Show registers
    use {
        "tversteeg/registers.nvim",
        config = function()
            require("registers").setup {
                window = {
                    border = "rounded",
                },
            }
        end,
    }
    -- Clipboard
    use {
        "AckslD/nvim-neoclip.lua", -- Clipboard manager inspired by clipmenu
        config = function()
            require("neoclip").setup()
        end,
    }
    -- Tabline
    use "akinsho/bufferline.nvim"
    -- Statusline
    use "nvim-lualine/lualine.nvim"
    use {
        "SmiteshP/nvim-gps",
        config = function()
            require("nvim-gps").setup()
        end,
    }
    -- Dashboard
    use {
        "goolord/alpha-nvim", -- A fast framework for making a greeter
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").opts)
        end,
    }
    -- Files and explorer
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup {}
        end,
    }
    use "kyazdani42/nvim-web-devicons"
    -- File managers
    use {
        "fhill2/xplr.nvim",
        run = function()
            require("xplr").install { hide = true }
        end,
        requires = { { "nvim-lua/plenary.nvim" }, { "MunifTanjim/nui.nvim" } },
    }
    -- Indentation
    use "lukas-reineke/indent-blankline.nvim"
    -- Zen mode
    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {}
        end,
    }
    use {
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup()
        end,
        cmd = { "TZMinimalist", "TZFocus", "TZAtaraxis" },
    }

    ---- Remote editing
    -- FIXME: :DistantInstall throws an error
    use {
        "chipsenkbeil/distant.nvim", -- Edit remote files using local environment
        config = function()
            require("distant").setup {
                -- Applies Chip"s personal settings to every machine you connect to
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file"s parent directory
                ["*"] = require("distant.settings").chip_default(),
            }
        end,
        cmd = { "DistantRun", "DistantOpen", "DistantConnet", "DistantLaunch" },
    }

    ---- Code execution
    -- FIXME: Had to manually run "install.sh", wait for update
    use {
        "michaelb/sniprun",
        run = "bash ./install.sh",
        cmd = { "SnipRun", "SnipInfo" },
    }
    use {
        "rcarriga/vim-ultest", -- Runs tests
        requires = { "vim-test/vim-test" },
        run = ":UpdateRemotePlugins",
        cmd = { "Ultest", "UltestLast", "UltestAttach", "UltestSummary" },
    }

    ---- Note taking
    -- NOTE: Might consider replacing this with telekasten.nvim
    use {
        "mickael-menu/zk-nvim",
    }
    -- Markdown preview
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        ft = "markdown",
        cmd = { "MarkdownPreview" },
    }
    use { "ellisonleao/glow.nvim", cmd = "Glow" }
    -- TODOS
    use {
        "folke/todo-comments.nvim", -- Highlight and list TODOs in your files
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
        end,
    }
    -- org-mode
    use {
        "nvim-orgmode/orgmode",
        config = function()
            require("orgmode").setup {}
            require("orgmode").setup_ts_grammar()
        end,
    }

    ---- Miscellaneous
    use "wakatime/vim-wakatime"
    use "gpanders/editorconfig.nvim"
    use {
        "RishabhRD/nvim-cheat.sh", -- Query cht.sh from nevim
        opt = true,
        requires = { "RishabhRD/popfix" },
        cmd = { "Cheat", "CheatList", "CheatWithoutComments", "CheatListWithoutComments" },
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
