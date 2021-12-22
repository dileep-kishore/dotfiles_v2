-- neuron config
local status_ok, neuron = pcall(require, "neuron")
if not status_ok then
    return
end

neuron.setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/Documents/Zettelkasten", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "<Space>n", -- the leader key to for all mappings, remember with 'go zettel'
}

-- glow config
vim.g.glow_border = "rounded"
vim.g.glow_width = 120
