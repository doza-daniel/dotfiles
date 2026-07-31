-- Go-specific function signature at cursor.
local function TS_go_func_signature_at_cursor()
  local bufnr = 0
  local node = vim.treesitter.get_node({ bufnr = bufnr })
  if not node then return "" end

  -- climb to enclosing Go function node
  while node and node:type() ~= "function_declaration" and node:type() ~= "method_declaration" do
    node = node:parent()
  end
  if not node then return "" end

  local name_node = node:field("name")[1]
  local name = name_node and vim.treesitter.get_node_text(name_node, bufnr) or "<anonymous>"

  -- method receiver: field "receiver" is a parameter_list in tree-sitter-go
  local recv_node = node:type() == "method_declaration" and node:field("receiver")[1] or nil
  local recv = recv_node and vim.treesitter.get_node_text(recv_node, bufnr) or nil

  -- parameters: field "parameters" (parameter_list)
  local params_node = node:field("parameters")[1]
  local params = params_node and vim.treesitter.get_node_text(params_node, bufnr) or "()"

  -- result: field "result" (can be type_identifier, qualified_type, parameter_list, etc.)
  local result_node = node:field("result")[1]
  local result = result_node and vim.treesitter.get_node_text(result_node, bufnr) or nil

  local sig = ""
  if recv then sig = sig .. "func " .. recv .. " " else sig = sig .. "func " end
  sig = sig .. name .. params
  if result and result ~= "" then
    -- Go prints results as either "T" or "(a T, b U)"
    sig = sig .. " " .. result
  end
  return sig
end

local function print_fn()
  local sig = TS_go_func_signature_at_cursor()
  if sig == "" then
    vim.notify("No Go function/method found at cursor", vim.log.levels.WARN)
  else
    print(sig)
  end
end

-- Map <Leader>f to print the Go function signature at cursor
vim.keymap.set("n", "<Leader>f", print_fn, { desc = "Print Go func signature (Tree-sitter)" })
