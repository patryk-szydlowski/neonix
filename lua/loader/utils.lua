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

return M
