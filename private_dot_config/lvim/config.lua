-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- normal mode keymaps
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.normal_mode["<C-q>"] = ":q<CR>"
-- insert mode keymaps
lvim.keys.insert_mode["jk"] = "<Esc>"

-- plugins
lvim.plugins = {
  {"catppuccin/nvim"},
}

-- colorscheme
lvim.colorscheme = "catppuccin-mocha"
