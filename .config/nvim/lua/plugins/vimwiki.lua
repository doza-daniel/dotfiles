return {
  "vimwiki/vimwiki",
  init = function()
    vim.keymap.set("n", "+", "<Plug>VimwikiRemoveHeaderLevel")
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_list = {
      {
        path = '~/Documents/wiki',
        syntax = 'default',
        ext = '.wiki',
      },
    }
  end,
}
