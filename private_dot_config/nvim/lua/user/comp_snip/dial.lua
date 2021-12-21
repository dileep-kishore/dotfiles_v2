local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-a>", "<Plug>(dial-increment)", opts)
keymap("n", "<C-x>", "<Plug>(dial-decrement)", opts)
keymap("v", "<C-a>", "<Plug>(dial-increment)", opts)
keymap("v", "<C-x>", "<Plug>(dial-decrement)", opts)
keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", opts)
keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", opts)
