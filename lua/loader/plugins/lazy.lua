local Loader = require("loader")

local M = {}

function M.setup(opts)
  local lazy_path = Loader.options.plugin_paths["lazy.nvim"]
    or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  local lazy_repo = "https://github.com/folke/lazy.nvim.git"

  if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      lazy_repo,
      lazy_path,
    })
  end

  vim.opt.rtp:prepend(lazy_path)

  local nix_environment_overrides = {
    performance = {
      reset_packpath = false,
      rtp = { reset = false },
    },
  }

  require("lazy").setup(
    vim.tbl_deep_extend(
      "force",
      opts or {},
      Loader.options.is_nix_environment and nix_environment_overrides or {}
    )
  )
end

return M
