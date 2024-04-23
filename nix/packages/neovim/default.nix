{ callPackage, vimPlugins, ... }:
{ src, wrap, ... }:
let
  builders = callPackage ./builders { };
  extraPlugins = [ vimPlugins.nvim-treesitter.withAllGrammars ];
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
