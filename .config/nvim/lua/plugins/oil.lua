return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>")
    return {
      columns = { "icon", "permissions", "size", "mtime" }
    }
  end
}
