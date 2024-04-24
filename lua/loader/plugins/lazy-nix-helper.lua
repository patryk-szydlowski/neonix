local Loader = require("loader")

local M = {}

function M.setup()
  local lazy_nix_helper_path = Loader.options.plugin_paths["lazy-nix-helper.nvim"]
    or vim.fn.stdpath("data") .. "/lazy_nix_helper/lazy_nix_helper.nvim"
  local lazy_nix_helper_repo = "https://github.com/b-src/lazy-nix-helper.nvim.git"

  if not (vim.uv or vim.loop).fs_stat(lazy_nix_helper_path) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=main",
      lazy_nix_helper_repo,
      lazy_nix_helper_path,
    })
  end

  vim.opt.rtp:prepend(lazy_nix_helper_path)

  require("lazy-nix-helper").setup({
    lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
    input_plugin_table = Loader.options.plugin_paths,
  })
end

function M.get_plugin_path(plugin_name)
  return require("lazy-nix-helper").get_plugin_path(plugin_name)
end

return M
