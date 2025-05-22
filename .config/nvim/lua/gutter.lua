local M = {}

M.set = function()
  local bufnr = vim.api.nvim_get_current_buf()

  vim.fn.sign_define("Plusic", { text = "+", texthl = "Normal" })
  vim.fn.sign_place(0, "PlusicGroup", "Plusic", bufnr, { lnum = 8 })
end

M.unset = function()
  vim.fn.sign_unplace("PlusicGroup")
end

local hunk_re = '^@@ %-(%d+),?(%d*) %+(%d+),?(%d*) @@'

local parseHunk = function(line)
  local from_line, from_count, to_line, to_count = line:match(hunk_re)
  if from_line and to_line then
    return {
      from_line = from_line,
      from_count= from_count ~= '' and from_count or 1,
      to_line   = to_line,
      to_count  = to_count ~= '' and to_count or 1,
    }
  end
end

local iterHunks = function(diff)
  local lines = {}
  for line in diff:gmatch("[^\r\n]+") do
    if line then table.insert(lines, line) end
  end
  local i = 1

  return function()
    while i <= #lines do
      local hunk = parseHunk(lines[i])
      i = i + 1
      if hunk then return hunk end
    end
  end
end

M.gitDiff = function()
  local filename = "../../.config/nvim/init.lua"
  local diff_output = vim.fn.system("git diff HEAD --unified=0 -- " .. filename)

  local bufnr = vim.api.nvim_get_current_buf()
  print(vim.fn.setbufvar(bufnr, 'gutter', {}))
  print(vim.fn.getbufvar(bufnr, 'gutter'))

  -- for h in iterHunks(diff_output) do
  --   print(vim.inspect(h))
  -- end
end

function M.process_hunks(bufnr, hunks)
  local modified_lines = {}
  for _, hunk in ipairs(hunks) do
    vim.list_extend(modified_lines, M.process_hunk(bufnr, hunk))
  end
  return modified_lines
end

function M.process_hunk(bufnr, hunk)
  local modifications = {}
  local from_line, from_count, to_line, to_count = hunk[1], hunk[2], hunk[3], hunk[4]

  if M.is_added(from_count, to_count) then
    M.process_added(modifications, from_count, to_count, to_line)
    vim.fn["gitgutter#hunk#increment_lines_added"](bufnr, to_count)

  elseif M.is_removed(from_count, to_count) then
    M.process_removed(modifications, from_count, to_count, to_line)
    vim.fn["gitgutter#hunk#increment_lines_removed"](bufnr, from_count)

  elseif M.is_modified(from_count, to_count) then
    M.process_modified(modifications, from_count, to_count, to_line)
    vim.fn["gitgutter#hunk#increment_lines_modified"](bufnr, to_count)

  elseif M.is_modified_and_added(from_count, to_count) then
    M.process_modified_and_added(modifications, from_count, to_count, to_line)
    vim.fn["gitgutter#hunk#increment_lines_added"](bufnr, to_count - from_count)
    vim.fn["gitgutter#hunk#increment_lines_modified"](bufnr, from_count)

  elseif M.is_modified_and_removed(from_count, to_count) then
    M.process_modified_and_removed(modifications, from_count, to_count, to_line)
    vim.fn["gitgutter#hunk#increment_lines_modified"](bufnr, to_count)
    vim.fn["gitgutter#hunk#increment_lines_removed"](bufnr, from_count - to_count)
  end

  return modifications
end

function M.is_added(from_count, to_count)
  return from_count == 0 and to_count > 0
end

function M.is_removed(from_count, to_count)
  return from_count > 0 and to_count == 0
end

function M.is_modified(from_count, to_count)
  return from_count > 0 and to_count > 0 and from_count == to_count
end

function M.is_modified_and_added(from_count, to_count)
  return from_count > 0 and to_count > 0 and from_count < to_count
end

function M.is_modified_and_removed(from_count, to_count)
  return from_count > 0 and to_count > 0 and from_count > to_count
end

function M.process_added(modifications, from_count, to_count, to_line)
  for offset = 0, to_count - 1 do
    table.insert(modifications, {to_line + offset, "added"})
  end
end

function M.process_removed(modifications, from_count, to_count, to_line)
  if to_line == 0 then
    table.insert(modifications, {1, "removed_first_line"})
  else
    table.insert(modifications, {to_line, "removed"})
  end
end

function M.process_modified(modifications, from_count, to_count, to_line)
  for offset = 0, to_count - 1 do
    table.insert(modifications, {to_line + offset, "modified"})
  end
end

function M.process_modified_and_added(modifications, from_count, to_count, to_line)
  local offset = 0
  while offset < from_count do
    table.insert(modifications, {to_line + offset, "modified"})
    offset = offset + 1
  end
  while offset < to_count do
    table.insert(modifications, {to_line + offset, "added"})
    offset = offset + 1
  end
end

function M.process_modified_and_removed(modifications, from_count, to_count, to_line)
  for offset = 0, to_count - 1 do
    table.insert(modifications, {to_line + offset, "modified"})
  end
  if to_count > 0 then
    modifications[#modifications] = {to_line + to_count - 1, "modified_removed"}
  end
end

return M

