return require("loader").plugin({
  "hrsh7th/nvim-cmp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
  },
  opts = {
    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
    },
  },
})
