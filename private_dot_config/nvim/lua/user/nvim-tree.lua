vim.g.nvim_tree_respect_buf_cwd = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
}
