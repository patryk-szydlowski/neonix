{ callPackage, ... }:
{ src, wrap, ... }:
let
  builders = callPackage ./builders { };
  plugins = callPackage ./plugins { };
  extraPlugins = [ plugins.nvim-treesitter.withAllGrammars ];
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
