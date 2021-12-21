local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-a>", ":DialIncrement", opts)
keymap("n", "<C-x>", ":DialDecrement", opts)
keymap("v", "<C-a>", ":DialIncrement", opts)
keymap("v", "<C-x>", ":DialDecrement", opts)
