{ callPackage, ... }:
{ src, wrap, ... }:
let
  builders = callPackage ./builders { };
  plugins = callPackage ./plugins { };
  extraPlugins = [
    plugins.cmp-path
    plugins.github-nvim-theme
    plugins.lazy-nix-helper
    plugins.lazy-nvim
    plugins.nvim-cmp
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
