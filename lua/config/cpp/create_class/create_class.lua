return function()
  if #vim.lsp.get_active_clients({ name = "clangd" }) then
    vim.ui.input({ prompt = "Fully qualified name (including namespace)" }, function(str)
      local config_dir = vim.fn.stdpath("config")
      local script = config_dir .. "/lua/config/cpp/create_class/create_class.py"

      local arr = vim.fn.split(str, "::")

      vim.cmd("!" .. script .. " " .. str)
      vim.cmd("edit " .. "include/" .. vim.fn.join(arr, "/") .. ".hpp")
    end)
  end
end
