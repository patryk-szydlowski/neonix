return require("loader").plugin({
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {},
  opts = {
    servers = {
      lua_ls = {},
    },
  },
  config = function(_, opts)
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    for server_name, server_opts in pairs(opts.servers) do
      server_opts.capabilities = capabilities
      require("lspconfig")[server_name].setup(server_opts)
    end
  end,
})
