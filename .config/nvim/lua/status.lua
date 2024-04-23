local M = {}

local statusLineMode = function()
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

M.statusLine = function()
    return statusLineMode() .. ' %t%m%r%=line: %l col: %c %y'
end

return M
