return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    keys = function()
      local telescope = require("telescope.builtin")
      return {
        { "<C-p>",      telescope.find_files, 'Find Files' },
        { "<leader>lg", telescope.live_grep,  'Live grep' },
      }
    end,
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
