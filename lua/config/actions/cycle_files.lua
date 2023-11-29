-- @brief Cycle throuch files in same directory
-- @param opts table
--   @key reverse bool (default false)
return function(opts)
  local current_dir = vim.fn.expand("%:p:h")
  local file_path = vim.fn.expand("%:p")
  local ls = vim.split(vim.fn.glob(current_dir .. "/*"), "\n", { trimempty = true })

  ls = vim.fn.filter(ls, function(_, str)
    return vim.fn.isdirectory(str) == 0
  end)

  local current = vim.fn.index(ls, file_path)
  local step = 1
  if opts and opts.reverse then
    step = -1
  end

  local next = (#ls + current + step) % #ls + 1

  vim.cmd("edit " .. ls[next])
end
