return require("loader").plugin({
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-path" },
  },
  opts = {
    sources = {
      { name = "path" },
    },
  },
})
