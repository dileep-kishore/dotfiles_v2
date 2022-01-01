-- neuron config

-- glow config
vim.g.glow_border = "rounded"
vim.g.glow_width = 120

-- org-mode config
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
    install_info = {
        url = "https://github.com/milisims/tree-sitter-org",
        revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
        files = { "src/parser.c", "src/scanner.cc" },
    },
    filetype = "org",
}
