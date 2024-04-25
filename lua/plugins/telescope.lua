return require("loader").plugin({
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-frecency.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          auto_depth = true,
          grouped = true,
        },
        frecency = {
          db_safe_mode = false,
          default_workspace = "CWD",
          show_filter_column = false,
          show_scores = true,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("frecency")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")

    local builtin = require("telescope.builtin")
    local extensions = require("telescope").extensions

    local function search_recent_files()
      extensions.frecency.frecency({ sorter = extensions.fzf.native_fzf_sorter() })
    end

    local function map(keys, func, desc)
      vim.keymap.set("n", keys, func, { desc = "Telescope: " .. desc })
    end

    map("<leader>sf", extensions.file_browser.file_browser, "Search Files")
    map("<leader>sr", search_recent_files, "Search Recent")
    map("<leader>sw", builtin.grep_string, "Search Word")
    map("<leader>sg", builtin.live_grep, "Search Grep")
  end,
})
