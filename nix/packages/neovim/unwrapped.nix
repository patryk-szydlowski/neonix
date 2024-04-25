{ callPackage, ... }:
let
  builders = callPackage ./builders { };
  dependencies = callPackage ./dependencies.nix { };
in
builders.buildNeovim {
  wrapRC = false;
  customRC = ":luafile init.lua";
  inherit (dependencies) plugins extraPackages;
}
