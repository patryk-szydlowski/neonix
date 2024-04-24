local M = {}

M.options = {
  is_nix_environment = false,
  plugin_paths = {},
}

function M.setup()
  local plugin_paths_available, plugin_paths = pcall(require, "loader.paths")

  M.options.is_nix_environment = plugin_paths_available
  M.options.plugin_paths = vim.tbl_deep_extend("force", {}, plugin_paths or {})

  if M.options.is_nix_environment then
    for _, runtime_path in ipairs(vim.opt.rtp:get()) do
      if vim.endswith(runtime_path, "vim-pack-dir") then
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
  end
end

function M.plugin(plugin)
  local plugin_path = require("loader.plugins.lazy-nix-helper").get_plugin_path(plugin)

  plugin.dir = plugin_path

  for index, plugin_dependency in ipairs(plugin.dependencies or {}) do
    plugin.dependencies[index] = M.plugin(plugin_dependency)
  end

  return plugin
end

return M
