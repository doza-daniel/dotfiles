local servers = {
  gopls = {},
  golangci_lint_ls = {},
  lua_ls = {},
  phpactor = {},
  denols = {},
  jedi_language_server = {},
}

local tools = {
  'golangci-lint',
  'stylua',
}

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'mason-org/mason.nvim', opts = {}
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = vim.list_extend(tools, vim.tbl_keys(servers)),
      }
    },
    { 'mason-org/mason-lspconfig.nvim' },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities() or {}
    for server_name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend(
        'force', capabilities, server.capabilities or {}
      )
      vim.lsp.config(server_name, server)
      vim.lsp.enable(server_name)
    end


    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local augroup = vim.api.nvim_create_augroup('my.lsp', { clear = true })
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Enable auto-completion.
        if client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        -- Auto-format ("lint") on save.
        if client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end

        local telescope = require('telescope.builtin')
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          local opts = { buffer = args.buf, desc = 'LSP: ' .. desc }
          vim.keymap.set(mode, keys, func, opts)
        end

        map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
        map('gr', telescope.lsp_references, '[G]oto [R]eferences')
        map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
        map('<C-u>', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        local organizeImports = function()
          local opts = {
            context = { only = { "source.organizeImports" } },
            apply = true,
          }
          vim.lsp.buf.code_action(opts)
        end

        map('<Leader>i', organizeImports, 'Organize [i]mports')
      end,
    })
  end
}
