return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {"-", "<CMD>Oil<CR>"}
  },
  opts = {
    columns = { "icon", "permissions", "size", "mtime" },
  },
}
