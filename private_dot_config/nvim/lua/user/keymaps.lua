-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -4<CR>", opts)
keymap("n", "<C-Down>", ":resize +4<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -4<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +4<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate tabs
keymap("n", "<C-t>", ":tabnew<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Turn off highlight after search
keymap("n", "<Leader>/", ":noh<CR>", opts)

-- Save files
keymap("n", "<C-s>", ":w<CR>", opts)

-- Close buffer
keymap("n", "<C-x>", ":Bdelete<CR>", opts)

-- Quit window
keymap("n", "<C-q>", ":q<CR>", opts)

-- TODO: Keybinding to remap movement (nnoremap j gj; nnoremap k gk)

-- Insert --
-- Move text up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

---- Hlslens
-- FIXME: Hlslens stops working after opening Telescope
keymap("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", opts)
keymap("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", opts)
keymap("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", opts)
keymap("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", opts)
keymap("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", opts)
keymap("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", opts)

---- Navigator.nvim
keymap("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
keymap("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
keymap("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
keymap("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
