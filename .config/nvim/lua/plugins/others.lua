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
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "go", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
    opts = {
      auto_install = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
  },
}
