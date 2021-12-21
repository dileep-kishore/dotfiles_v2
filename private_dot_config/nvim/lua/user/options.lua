-- :help options
vim.opt.backup = false -- turns off backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- number of screen lines to use for command-line
vim.opt.completeopt = { "menuone", "noselect" } -- list of options for insert mode completion
vim.opt.laststatus = 2 -- always show statusline
vim.opt.conceallevel = 1 -- concealed text is replaced with one charcter
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.incsearch = true -- incremental search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don"t need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- turns off swapfile creation
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 750 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- do not make backup before overwritting a file
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 4 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- minimal no. of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal no. of screen lines to keep left and right of the cursor
vim.opt.guifont = "Cascadia Code:h12" -- the font used in graphical neovim applications
vim.opt.listchars = { -- Set list chars
    eol = "↲",
    tab = "▷⋯",
    trail = "•",
    nbsp = "␣",
}
vim.opt.list = true
vim.opt.showbreak = "↳ " -- Show break for wrapped lines
vim.opt.shortmess:append { c = true }
vim.opt.formatoptions:append { "n", "1" }
vim.opt.formatoptions:remove { "r", "o" }
