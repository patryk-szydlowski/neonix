local M = {}

function M.fix_plugin_in_non_nix_environment(plugin)
  plugin.dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = true } },
    unpack(plugin.dependencies or {}),
  }
end

return M
