return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install {
      "python",
      "javascript",
      "go",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
    }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        "python",
        "javascript",
        "go",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
      },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
