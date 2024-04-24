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

function M.fix_plugin(plugin, plugin_fixer_function)
  local plugin_name = M.get_plugin_name(plugin)
  local _, plugin_module = pcall(require, "loader.plugins." .. plugin_name)
  local plugin_fixer = (plugin_module or {})[plugin_fixer_function]

  if plugin_fixer then
    plugin_fixer(plugin)
  end
end

function M.fix_plugin_in_nix_environment(plugin)
  return M.fix_plugin(plugin, "fix_plugin_in_nix_environment")
end

function M.fix_plugin_in_non_nix_environment(plugin)
  return M.fix_plugin(plugin, "fix_plugin_in_non_nix_environment")
end

return M
