require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.impatient")
require("user.colorscheme")

-- FIXME: These have to be set at end because a plugin is modifying them
vim.opt.formatoptions:append({"n", "1"})
vim.opt.formatoptions:remove({"r", "o"})
