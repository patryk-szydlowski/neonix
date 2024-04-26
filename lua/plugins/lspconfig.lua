return require("loader").plugin({
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", opts = {} },
    { "folke/neodev.nvim" },
  },
  opts = {},
  config = function(_, opts)
    require("neodev").setup()

    local servers =
      vim.tbl_deep_extend("force", opts.servers or {}, require("neoconf").get("lspconfig", {}))

    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    vim.iter(servers):each(function(server_name, server_opts)
      server_opts.capabilities = capabilities
      require("lspconfig")[server_name].setup(server_opts)
    end)
  end,
})
