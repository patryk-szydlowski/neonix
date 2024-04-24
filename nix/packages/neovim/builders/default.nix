{ callPackage, ... }:
let
  buildNeovimConfiguration = callPackage ./neovim-configuration.nix { };
  buildNeovimLoader = callPackage ./neovim-loader.nix { };
  buildNeovimPlugins = callPackage ./neovim-plugins.nix { };
  buildNeovim = callPackage ./neovim.nix {
    inherit buildNeovimConfiguration buildNeovimLoader buildNeovimPlugins;
  };
in
{
  inherit
    buildNeovimConfiguration
    buildNeovimLoader
    buildNeovimPlugins
    buildNeovim
    ;
}
