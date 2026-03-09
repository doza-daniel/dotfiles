local M = {
  open = false,
  win = -1,
  buf = -1,
}

local auGroup = vim.api.nvim_create_augroup("timeline", { clear = true })

vim.api.nvim_create_autocmd({ "WinClosed" }, {
  group = auGroup,
  callback = function(e)
    M:closed(tonumber(e.file))
  end
})

function M:closed(win)
  if self.win == win then
    M:callback()
  end
end

function M:f()
  if self.open then
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  if buf == 0 then
    vim.print("failed creating buffer")
    return
  end
  local opts = {
    split = "above",
    height = 3,
    style = "minimal",
  }
  self.win = vim.api.nvim_open_win(buf, false, opts)
  self.open = true
  self.buf = vim.api.nvim_get_current_buf()

  vim.keymap.set("n", "q", function()
    M:callback()
  end, { buffer = true })

  local decoded = vim.json.decode(
    '[{"start":1234,"endd":1238,"adherent":true},{"start":1238,"endd":1245,"adherent":false},{"start":1245,"endd":1280,"adherent":true},{"start":1280,"endd":1282,"adherent":false}]'
  )
  M:draw(decoded)
  -- for i, event in ipairs(decoded) do
  --   vim.print(i, event)
  --   vim.print(event.start)
  --   vim.print(event.endd)
  -- end
end

function M:sra()
  local x = "daniel"
  vim.print(x:sub(1, #x - 1) .. "p")
end

function M:draw(events)
  if not self.open then
    return
  end

  local intervalLen = events[#events].endd - events[1].start

  local cols = vim.api.nvim_win_get_width(self.win)

  local allText = ""
  for i, event in ipairs(events) do
    local se = event.endd - event.start
    local l = math.floor(cols * se / intervalLen)

    local x = ""
    if event.adherent then
      x = string.rep("+", l)
    else
      x = string.rep("-", l)
    end

    if i ~= #events then
      x = x:sub(1, #x - 1) .. "|"
    end
    allText = allText .. x
  end

  vim.api.nvim_buf_set_lines(vim.api.nvim_win_get_buf(self.win), 0, 0, true, { "", allText })

  vim.print("asdf: ", intervalLen)
end

function M:callback()
  if not self.open then
    return
  end
  self.open = false
  vim.keymap.del("n", "q", { buffer = self.buf })
  vim.api.nvim_win_close(self.win, true)
end

return M
