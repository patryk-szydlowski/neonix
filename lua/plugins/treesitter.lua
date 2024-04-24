return require("loader").plugin({
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = "all",
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
})
