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
    use "nvim-lua/plenary.nvim"                                  -- Useful lua functions used ny lots of plugins
    use "lewis6991/impatient.nvim"                               -- Speed up loading lua modules

    -- Treesitter related
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"            -- For context dependent commenting

    -- Telescope related
    use "nvim-telescope/telescope.nvim"                          -- Find, Filter, Preview, Pick.
    use {
        "nvim-telescope/telescope-fzf-native.nvim",              -- Native C sorting for better performance
        run = "make"
    } 
    -- Project management
    use "ahmedkhalf/project.nvim"                                -- Superior project management

    -- LSP related
    use "neovim/nvim-lspconfig"                                  -- Collection of configurations for built-in LSP client 
    use "williamboman/nvim-lsp-installer"                        -- Fast and easy-to-use language server installer
    use "tamago324/nlsp-settings.nvim"                           -- language server settings defined in json
    use "jose-elias-alvarez/null-ls.nvim"                        -- configurations for formatters and linters
    use "folke/trouble.nvim"                                     -- A pretty list for showing diagnostics
    -- Code navigation
    use "simrat39/symbols-outline.nvim"                          -- A tree like view for navigating symbols
    -- Spell check
    use "lewis6991/spellsitter.nvim"

    -- Completions
    use "windwp/nvim-autopairs"                                  -- Power autopair plugin for Neovim

    -- Keybindings
    use "folke/which-key.nvim"                                   -- Displays popup with possible keybindings of command
    -- Commenting
    use {
        "numToStr/Comment.nvim",                                 -- Smart powerful commenting framework
        config = function()
            require("Comment").setup()
        end
    }

    -- Git
    use "TimUntersberger/neogit"                                 -- Magit clone for Neovim
    use {
        "pwntester/octo.nvim",                                   -- Edit GitHub issues and pull requests
        config = function()
            require"octo".setup()
        end 
    }  
    use "lewis6991/gitsigns.nvim"                                -- Show better gitsigns in the gutter

    -- Motions, windows and navigation
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

    -- Themes and eye candy
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim"
    -- Tabline
    use "akinsho/bufferline.nvim"                                -- A snazzy buffer line built using lua
    -- Statusline
    use "nvim-lualine/lualine.nvim"                              -- A blazing fast statusline written in lua
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
    use "kyazdani42/nvim-web-devicons"                           -- Nice set of icons for files
    -- Indentation
    use "lukas-reineke/indent-blankline.nvim"                    -- Adds indentation guides to all lines (including blanks)


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
