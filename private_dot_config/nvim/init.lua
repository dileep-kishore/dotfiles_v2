require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.plugins")
require("user.impatient")
require("user.colorscheme")
require("user.completions")
-- require("user.misc")

-- FIXME: These have to be set at end because a plugin is modifying them
vim.opt.formatoptions:append({"n", "1"})
vim.opt.formatoptions:remove({"r", "o"})
