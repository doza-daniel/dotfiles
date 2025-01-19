return {
  'stevearc/oil.nvim',
  opts = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>")
  end
}
