local Utils = require("loader.utils")

local M = {}

M.options = {
  is_nix_environment = false,
  plugin_paths = {},
}

function M.setup()
  local plugin_paths_available, plugin_paths = pcall(require, "loader.paths")

  M.options.is_nix_environment = plugin_paths_available
  M.options.plugin_paths = plugin_paths_available and plugin_paths or {}

  if M.options.is_nix_environment then
    local runtime_path = vim.iter(vim.opt.rtp:get()):find(function(path)
      return vim.endswith(path, "vim-pack-dir")
    end)

    vim.opt.rtp = {
      vim.fn.stdpath("config"),
      runtime_path,
      vim.env.VIMRUNTIME,
      vim.fn.stdpath("config") .. "/after",
    }
    vim.opt.packpath = {
      runtime_path,
      vim.env.VIMRUNTIME,
    }
  end
end

function M.plugin(plugin)
  if M.options.is_nix_environment then
    Utils.fix_plugin_in_nix_environment(plugin)
  else
    Utils.fix_plugin_in_non_nix_environment(plugin)
  end

  plugin.dir = Utils.get_plugin_path(plugin)
  plugin.dependencies = vim.iter(plugin.dependencies or {}):map(M.plugin):totable()

  return plugin
end

return M
