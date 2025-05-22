return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    keys = {
      {"<C-p>", require("telescope.builtin").find_files},
      {"<leader>lg", require("telescope.builtin").live_grep},
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          ".git/"
        },
      },
      pickers = {
        find_files = {
          hidden = true
        }
      },
    },
  }
}
