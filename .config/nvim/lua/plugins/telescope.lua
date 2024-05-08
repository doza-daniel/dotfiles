return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", telescope.find_files)
      vim.keymap.set("n", "<Leader>lg", telescope.live_grep)
    end,
    pickers = {
      find_files = {
        hidden = true
      }
    }
  }
}
