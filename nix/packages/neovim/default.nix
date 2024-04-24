{ callPackage, ... }:
{ src, wrap, ... }:
let
  builders = callPackage ./builders { };
  plugins = callPackage ./plugins { };
  extraPlugins = [
    plugins.cmp-nvim-lsp
    plugins.cmp-path
    plugins.github-nvim-theme
    plugins.lazy-nix-helper
    plugins.lazy-nvim
    plugins.nvim-cmp
    plugins.nvim-lspconfig
    plugins.nvim-treesitter.withAllGrammars
  ];
  extraPackages = [ ];
in
builders.buildNeovim {
  inherit
    src
    wrap
    extraPlugins
    extraPackages
    ;
}
