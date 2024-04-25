vim.cmd.colorscheme("gruvbox")


vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup('on-colorscheme-change', { clear = true }),
  callback = function()
    -- tab symbol gray
    vim.cmd.highlight("SpecialKey ctermbg=none ctermfg=244")

    -- remove background from colorscheme
    vim.cmd.highlight("Normal ctermbg=none guibg=none")
    vim.cmd.highlight("SignColumn ctermbg=none guibg=none")
    vim.cmd.highlight("NonText ctermbg=none guibg=none")
    vim.cmd.highlight("LineNr ctermbg=none guibg=none")
  end
})
