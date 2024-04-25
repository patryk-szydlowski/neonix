{ callPackage, ... }:
{ src, ... }:
let
  builders = callPackage ./builders { };
  dependencies = callPackage ./dependencies.nix { };
  configuration = builders.buildNeovimConfiguration { inherit src; };
in
builders.buildNeovim {
  wrapRC = true;
  customRC = ":luafile ${src}/init.lua";
  plugins = dependencies.plugins ++ [ configuration ];
  inherit (dependencies) extraPackages;
}
