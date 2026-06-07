local auGroup = vim.api.nvim_create_augroup('on-colorscheme-change', { clear = true })

vim.api.nvim_create_autocmd('ColorScheme', {
  group = auGroup,
  callback = function()
    -- remove background from colorscheme
    -- vim.cmd.highlight("Normal ctermbg=none guibg=none")
    -- vim.cmd.highlight("SignColumn ctermbg=none guibg=none")
    -- vim.cmd.highlight("NonText ctermbg=none guibg=none")
    -- vim.cmd.highlight("LineNr ctermbg=none guibg=none")
    -- vim.cmd.highlight("VertSplit ctermbg=none guibg=none")
  end
})

local ghosttyToNvim = {
  ["gruvbox light"] = "gruvbox",
  ["gruvbox dark"] = "gruvbox",
  ["catppuccin frappe"] = "catppuccin-frappe",
  ["catppuccin latte"] = "catppuccin-latte",
  ["catppuccin macchiato"] = "catppuccin-macchiato",
  ["catppuccin mocha"] = "catppuccin-mocha",
}

local setColorscheme = function()
  local theme = 'default'

  local ghosttyConfig = vim.system({ "ghostty", "+show-config" }, { text = true }):wait().stdout

  if ghosttyConfig then
    for s in ghosttyConfig:gmatch("theme = [^\n]+") do
      local parsed, _ = s:gsub("theme = ", "")
      theme = ghosttyToNvim[parsed:lower()] or theme
    end
  end

  vim.cmd.colorscheme(theme)
end

setColorscheme()

vim.api.nvim_create_autocmd('OptionSet', {
  group = auGroup,
  pattern = 'background',
  callback = setColorscheme,
})
