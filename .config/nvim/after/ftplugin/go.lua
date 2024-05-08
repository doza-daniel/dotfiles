vim.o.expandtab = false

local autocmd_group = vim.api.nvim_create_augroup('go-autocommands', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    group = autocmd_group,
    pattern = { '*.go' },
    desc = 'Auto-format Go files after saving',
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !goimports -w " .. fileName)
    end,
})
