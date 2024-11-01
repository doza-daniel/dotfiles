vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup('on-colorscheme-change', { clear = true }),
  callback = function()
    -- remove background from colorscheme
    vim.cmd.highlight("Normal ctermbg=none guibg=none")
    vim.cmd.highlight("SignColumn ctermbg=none guibg=none")
    vim.cmd.highlight("NonText ctermbg=none guibg=none")
    vim.cmd.highlight("LineNr ctermbg=none guibg=none")
    vim.cmd.highlight("VertSplit ctermbg=none guibg=none")
  end
})

vim.cmd.colorscheme("habamax")
