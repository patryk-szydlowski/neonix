local M = {}

local function default_plugin_opts(opts)
  return opts
end

function M.get_plugin_name(plugin)
  return plugin[1]:gsub("%.nvim$", ""):gsub("^.+/", "")
end

function M.get_plugin_path(plugin)
  local plugin_name = M.get_plugin_name(plugin)
  return require("loader.plugins.lazy-nix-helper").get_plugin_path(plugin_name)
end

function M.fix_plugin_in_nix_environment(plugin)
  local plugin_name = M.get_plugin_name(plugin)
  local _, plugin_module = pcall(require, "loader.plugins." .. plugin_name)
  local plugin_fixer = (plugin_module or {}).fix_plugin_in_nix_environment

  if plugin_fixer then
    plugin_fixer(plugin)
  end
end

return M
