local opts = { silent = true, noremap = true }

-- Keybindings
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
