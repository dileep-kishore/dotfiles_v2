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

-- Use a protected call so we don't error out on first use
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

    -- Treesitter related
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "JoosepAlviste/nvim-ts-context-commentstring"            -- For context dependent commenting

    -- Telescope related
    use "nvim-telescope/telescope.nvim"                          -- Find, Filter, Preview, Pick.
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Native C sorting for better performance

    -- LSP related
    use "neovim/nvim-lspconfig"                                  -- Collection of configurations for built-in LSP client 
    use "williamboman/nvim-lsp-installer"                        -- Fast and easy-to-use language server installer
    use "tamago324/nlsp-settings.nvim"                           -- language server settings defined in json
    use "jose-elias-alvarez/null-ls.nvim"                        -- configurations for formatters and linters
    use "folke/trouble.nvim"                                     -- A pretty list for showing diagnostics

    -- Completions

    -- Keybindings
    use "folke/which-key.nvim"                                   -- Displays popup with possible keybindings of command

    -- Git
    use "TimUntersberger/neogit"                                 -- Magit clone for Neovim
    use "lewis6991/gitsigns.nvim"                                -- Show better gitsigns in the gutter

    -- Themes and eye candy
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim"
    -- Dashboard
    -- Files and explorer
    use { "kyazdani42/nvim-tree.lua", config = function() require "nvim-tree".setup {} end }
    use "kyazdani42/nvim-web-devicons"                           -- Nice set of icons for files
    -- Indentation
    use "lukas-reineke/indent-blankline.nvim"                    -- Adds indentation guides to all lines (including blanks)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
