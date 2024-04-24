require("loader").setup()
require("loader.plugins.lazy-nix-helper").setup()
require("loader.plugins.lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
  },
})
