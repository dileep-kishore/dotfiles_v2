local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print "Installing packer close and reopen Neovim..."
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
}

---- Plugins ----
return packer.startup(function(use)
    use "wbthomason/packer.nvim"                                 -- Have packer manage itself
    use "lewis6991/impatient.nvim"                               -- Speed up loading lua modules
    use "nvim-lua/plenary.nvim"                                  -- Useful lua functions used ny lots of plugins
    use "nvim-lua/popup.nvim"                                    -- Popup related code not yet in Neovim
    use "rcarriga/nvim-notify"                                   -- Configurable notification manager

    ---- Treesitter related
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }    -- Rainbow paranthesis
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",           -- For context dependent commenting
        after = "nvim-treesitter"
    }
    use {
        "romgrk/nvim-treesitter-context",                        -- Shows context of current position using floatin window
        after = "nvim-treesitter"
    }
    -- Quick fix window
    use {"kevinhwang91/nvim-bqf", ft = "qf"}                     -- Make Neovim quickfix window better
    -- file types
    use "nathom/filetype.nvim"                                   -- Speed up neovim filetype loading

    ---- Telescope related
    use "nvim-telescope/telescope.nvim"                          -- Find, Filter, Preview, Pick.
    use {
        "nvim-telescope/telescope-fzf-native.nvim",              -- Native C sorting for better performance
        run = "make"
    }
    -- Project management
    use "ahmedkhalf/project.nvim"                                -- Superior project management

    ---- LSP related
    use "neovim/nvim-lspconfig"                                  -- Collection of configurations for built-in LSP client
    use "williamboman/nvim-lsp-installer"                        -- Fast and easy-to-use language server installer
    use "tamago324/nlsp-settings.nvim"                           -- language server settings defined in json
    use "jose-elias-alvarez/null-ls.nvim"                        -- configurations for formatters and linters
    use {
        'rmagatti/goto-preview',                                 -- Preview goto definition in floating window
        config = function()
            require('goto-preview').setup {}
        end
    }
    -- completions
    use "onsails/lspkind-nvim"                                   -- Pretty icons for LSP completions
    use "ray-x/lsp_signature.nvim"                               -- Show function signatures
    -- Diagonostics
    use "folke/trouble.nvim"                                     -- A pretty list for showing diagnostics
    use "antoinemadec/FixCursorHold.nvim"                        -- FIXME: This is needed to fix lsp doc highlight
    -- Code navigation
    use "simrat39/symbols-outline.nvim"                          -- A tree like view for navigating symbols
    -- Spell check
    use "lewis6991/spellsitter.nvim"

    ---- Completions
    use "hrsh7th/nvim-cmp"                                       -- The completion plugin
    use "hrsh7th/cmp-buffer"                                     -- buffer completions
    use "hrsh7th/cmp-path"                                       -- path completions
    use "hrsh7th/cmp-cmdline"                                    -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"                               -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"                                   -- lsp completions
    use "petertriho/cmp-git"                                     -- git issue/pull request completions
    -- snippets
    use "L3MON4D3/LuaSnip"                                       -- snippet engine
    use "rafamadriz/friendly-snippets"                           -- a bunch of snippets to use
    -- documentation
    use {
        "kkoomen/vim-doge",                                      -- generates documentation skeletons
        run = ":call doge#install()",
        opt = true,
        cmd = { "DogeGenerate", "DogeCreateDocStandard" }
    }
    -- Brackets
    use "windwp/nvim-autopairs"                                  -- Power autopair plugin for Neovim
    -- Wild menu
    use { "gelguy/wilder.nvim", run = ":UpdateRemotePlugins" }   -- Wild menu customization
    -- Increment and decrement library
    use "monaqa/dial.nvim"                                       -- Increment/decrement various numbers and things

    ---- Keybindings
    use "folke/which-key.nvim"                                   -- Displays popup with possible keybindings of command
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}       -- Faster Esc mapping
    -- Commenting
    use {
        "numToStr/Comment.nvim",                                 -- Smart powerful commenting framework
        config = function()
            require("Comment").setup()
        end
    }

    ---- Git
    use "TimUntersberger/neogit"                                 -- Magit clone for Neovim
    use {
        "pwntester/octo.nvim",                                   -- Edit GitHub issues and pull requests
        config = function()
            require"octo".setup()
        end
    }
    use "lewis6991/gitsigns.nvim"                                -- Show better gitsigns in the gutter
    -- git diffs
    use "sindrets/diffview.nvim"                                 -- Easily cycle through diffs for modified files in a git rev

    ---- Session management
    use {
        'rmagatti/auto-session',                                 -- Seamless automatic session management
        config = function()
            require('auto-session').setup {
                log_level = 'info',
                auto_session_suppress_dirs = {'~/', '~/Projects'}
            }
        end
    }
    use {
        'rmagatti/session-lens',                                 -- Fuzzy session switcher using Telescope
        config = function()
            require('session-lens').setup()
        end
    }


    ---- Motions, windows and navigation
    use "ggandor/lightspeed.nvim"                                -- Vim motions on steroids
    use "edluffy/specs.nvim"                                     -- show where your cursor moves when jumping around
    use "tpope/vim-repeat"                                       -- Plugin to repeat complex maps
    use "tpope/vim-unimpaired"                                   -- Complementary pairs of mappings
    use "tpope/vim-surround"                                     -- Surround.vim
    use {
        "mizlan/iswap.nvim",                                     -- Interactively swap treesitter elements
        opt = true,
        cmd = { "ISwap", "ISwapWith" }
    }
    -- Search
    use "windwp/nvim-spectre"                                    -- Project wide search and replace
    use "kevinhwang91/nvim-hlslens"                              -- Better highlight searches
    -- Peek
    use "nacro90/numb.nvim"                                      -- Peek at lines of buffer in a non-intrusive way
    -- Marks
    use "chentau/marks.nvim"                                     -- Better UI for manipulating mark
    -- Window management
    use "famiu/bufdelete.nvim"                                   -- Delete buffers without messing up window layout
    -- Terminals
    use "akinsho/toggleterm.nvim"                                -- Persist and toggle multiple terminals during an editing session
    -- TMUX Navigation
    use {
        "numToStr/Navigator.nvim",                               -- Smoothly navigate between splits and panes
        config = function()
            require("Navigator").setup()
        end
    }

    ---- Language specific
    -- LaTeX
    -- TODO: LaTeX support with vimtex(?)
    -- Python
    use {
        "untitled-ai/jupyter_ascending.vim",                    -- Edit jupytext file and keep it in syc with .ipynb
        opt = true,
        ft = { "python" }
    }

    ---- Themes and eye candy
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim"
    use "norcalli/nvim-colorizer.lua"                            -- Colorizer
    -- Smooth scrolling
    use 'karb94/neoscroll.nvim'                                  -- Smooth scrolling in Neovim
    -- Highlights
    use "RRethy/vim-illuminate"                                  -- Show all occurrences of word under cursor
    -- Show registers
    use "tversteeg/registers.nvim"                               -- Show register content during access
    -- Clipboard
    use {
        "AckslD/nvim-neoclip.lua",                               -- Clipboard manager inspired by clipmenu
        config = function()
            require('neoclip').setup()
        end,
    }
    -- Tabline
    use "akinsho/bufferline.nvim"                                -- A snazzy buffer line built using lua
    -- Statusline
    use "nvim-lualine/lualine.nvim"                              -- A blazing fast statusline written in lua
    use "SmiteshP/nvim-gps"                                      -- Status line component to show exact cursor position
    -- Dashboard
    use {
        "goolord/alpha-nvim",                                    -- A fast framework for making a greeter
        config = function ()
            require"alpha".setup(require"alpha.themes.dashboard".opts)
        end
    }
    -- Files and explorer
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require "nvim-tree".setup {}
        end
    }
    use {
        "luukvbaal/nnn.nvim",                                    -- Use nnn from neovim
        opt = true,
        cmd = { "NnnExplorer", "NnnPicker" },
        config = function() require("nnn").setup() end
    }
    use "kyazdani42/nvim-web-devicons"                           -- Nice set of icons for files
    -- Indentation
    use "lukas-reineke/indent-blankline.nvim"                    -- Adds indentation guides to all lines (including blanks)
    -- Zen mode
    use "Pocco81/TrueZen.nvim"                                   -- Distraction free writing

    ---- Remote editing
    use {
        "chipsenkbeil/distant.nvim",                             -- Edit remote files using local environment
        config = function()
            require("distant").setup {
                -- Applies Chip"s personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file"s parent directory
                ["*"] = require("distant.settings").chip_default()
            }
        end
    }

    ---- Code execution
    use { "michaelb/sniprun", run = "bash ./install.sh"}        -- Code runner plugin for neovim
    use {
        "rcarriga/vim-ultest",                                  -- Runs tests
        requires = {"vim-test/vim-test"},
        run = ":UpdateRemotePlugins"
    }

    ---- Note taking
    use "oberblastmeister/neuron.nvim"                          -- Zettelkasten note-taking using the neuron binary
    -- Markdown preview
    use "ellisonleao/glow.nvim"                                 -- Markdown preview in the terminal using glow
    -- TODOS
    use {
        "folke/todo-comments.nvim",                             -- Highlight and list TODOs in your files
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    ---- Miscellaneous
    use "wakatime/vim-wakatime"                                 -- Track your coding activity
    use "gpanders/editorconfig.nvim"                            -- Editconfig support
    use {
        "RishabhRD/nvim-cheat.sh",                              -- Query cht.sh from nevim
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
