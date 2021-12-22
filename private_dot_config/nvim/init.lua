require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.plugins"
require "user.impatient"
require "user.colorscheme"
require "user.comp_snip"
require "user.lsp"
require "user.treesitter"
require "user.comment"
require "user.telescope"
require "user.nvim-tree"
require "user.git"
require "user.bars"
require "user.togglterm"
require "user.indentline"
require "user.dashboard"
require "user.whichkey"
require "user.navigation"
-- require("user.misc")

-- FIXME: These have to be set at end because a plugin is modifying them
vim.opt.formatoptions:append { "n", "1" }
vim.opt.formatoptions:remove { "r", "o" }
