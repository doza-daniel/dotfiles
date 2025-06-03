return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "gb", "<CMD>Git blame<CR>" }
    }
  },
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          vim.cmd('GitGutter')
        end
      })
      vim.o.updatetime = 200
    end
  },
  { "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" } },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
}
