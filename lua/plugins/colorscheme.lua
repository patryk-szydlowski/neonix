return require("loader").plugin({
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd("colorscheme github_dark_dimmed")
  end,
})
