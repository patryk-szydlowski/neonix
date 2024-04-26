return require("loader").plugin({
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", opts = {} },
    { "folke/neodev.nvim" },
  },
  opts = {
    servers = {
      lua_ls = {
        Lua = {
          hint = { enable = true },
        },
      },
    },
  },
  config = function(_, opts)
    require("neodev").setup()

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local builtin = require("telescope.builtin")

        local function toggle_inlay_hints()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(event.buf))
        end

        local function map(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

        map("gd", builtin.lsp_definitions, "Goto Definition")
        map("gr", builtin.lsp_references, "Goto References")

        map("<leader>sd", builtin.lsp_document_symbols, "Search Document Symbols")
        map("<leader>sw", builtin.lsp_dynamic_workspace_symbols, "Search Workspace Symbols")

        map("<leader>th", toggle_inlay_hints, "Toggle Inlay Hints")
      end,
    })

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
