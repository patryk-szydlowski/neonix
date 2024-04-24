{ callPackage, ... }:
{ src, wrap, ... }:
let
  builders = callPackage ./builders { };
  plugins = callPackage ./plugins { };
  extraPlugins = [
    plugins.github-nvim-theme
    plugins.lazy-nix-helper
    plugins.lazy-nvim
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
