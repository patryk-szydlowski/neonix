{ callPackage, ... }:
{ src, wrap, ... }:
let
  builders = callPackage ./builders { };
  extraPlugins = [ ];
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
