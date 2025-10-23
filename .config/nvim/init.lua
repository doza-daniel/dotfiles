-- Set leader to space bar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Hide netrw banner and work like a tree
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- Convenient {} placement
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-- tabs
vim.keymap.set("n", "<Leader>N", "<CMD>tabnew<CR>")
vim.keymap.set("n", "<Leader>n", "<CMD>tabnext<CR>")
vim.keymap.set("n", "<Leader>p", "<CMD>tabprevious<CR>")
vim.keymap.set("n", "<Leader>c", "<CMD>tabclose<CR>")

local o = vim.opt

-- StatusLine
o.laststatus = 2
o.statusline = '%!v:lua.require("status").statusLine()'
o.showmode = false

-- Friednly splits
o.splitright = true
o.splitbelow = true

-- Display whitespaces (trailing and tabs)
o.list = true
o.listchars = { trail = '·', tab = '>-' }

-- Set line numbers visible
o.number = true
o.relativenumber = true
o.cursorline = true

-- Indentation
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

-- Searching options
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- No delay going in normal mode
o.ttimeoutlen = 10

-- Show sign column always
o.signcolumn = "yes"

-- Tweak completion menu popup
o.completeopt = { 'menu', 'menuone', 'popup', 'noinsert', 'fuzzy' }

require("bootstrap")
require("colors")
