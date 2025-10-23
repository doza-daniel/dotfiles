return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    {"-", "<CMD>Oil<CR>"}
  },
  opts = {
    columns = { "icon", "permissions", "size", "mtime" },
  },
}
