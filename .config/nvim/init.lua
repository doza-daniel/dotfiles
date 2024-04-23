-- Set leader to space bar
vim.g.mapleader = " "

-- StatusLine
vim.o.laststatus=2
vim.o.statusline='%{v:lua.statusLineMode()} %t%m%r%=line: %l col: %c %y'
vim.o.showmode=false

statusLineMode = function()
    local mode = vim.fn.mode()
    if (mode == "n") then
      return "[NORMAL]"
    end
    if mode =="v" then
      return "[VISUAL]"
    end
    if mode =="V" then
      return "[VISUAL LINE]"
    end
    if mode =="" then
      return "[VISUAL BLOCK]"
    end
    if mode == "i" then
      return "[INSERT]"
    end
    if mode == "R" then
      return "[REPLACE]"
    end
    if mode == "s" then
      return "[SELECT]"
    end
    if mode == "t" then
      return "[TERMINAL]"
    end
    if mode == "c" then
      return "[COMMAND]"
    end
    if mode == "!" then
      return "[SHELL]"
    end
end

-- Display whitespaces (trailing and tabs)
vim.o.list = true
vim.opt.listchars = { trail = '·', tab = '>-'}

-- Set line numbers visible
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Indentation
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Searching options
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- No delay going in normal mode
vim.o.ttimeoutlen = 10

-- Convenient {} placement
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-- Hide netrw banner and work like a tree
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
