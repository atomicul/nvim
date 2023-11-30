function InitCppProject()
  local current_dir = vim.fn.expand("%:p:h")
  local config_dir = vim.fn.stdpath("config")
  local bash_script = config_dir .. "/lua/config/cpp/init_project/init_project.sh"
  vim.cmd("!" .. bash_script .. " " .. current_dir)
  vim.cmd("Task start cmake configure")
end
