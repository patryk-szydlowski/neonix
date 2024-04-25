{ pkgs, callPackage, ... }:
let
  plugins = callPackage ./plugins { };
in
{
  plugins = [
    plugins.cmp-buffer
    plugins.cmp-nvim-lsp
    plugins.cmp-path
    plugins.cmp_luasnip
    plugins.github-nvim-theme
    plugins.lazy-nix-helper
    plugins.lazy-nvim
    plugins.lspkind-nvim
    plugins.luasnip
    plugins.neoconf-nvim
    plugins.neodev-nvim
    plugins.nvim-cmp
    plugins.nvim-lspconfig
    plugins.nvim-treesitter.withAllGrammars
    plugins.nvim-web-devicons
    plugins.plenary-nvim
    plugins.telescope-file-browser-nvim
    plugins.telescope-frecency-nvim
    plugins.telescope-fzf-native-nvim
    plugins.telescope-nvim
    plugins.telescope-ui-select-nvim
  ];
  extraPackages = [
    pkgs.fd
    pkgs.fzf
    pkgs.ripgrep
  ];
}
