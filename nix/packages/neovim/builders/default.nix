{ callPackage, ... }:
let
  buildNeovimConfiguration = callPackage ./neovim-configuration.nix { };
  buildNeovimPlugins = callPackage ./neovim-plugins.nix { };
  buildNeovim = callPackage ./neovim.nix { inherit buildNeovimConfiguration buildNeovimPlugins; };
in
{
  inherit buildNeovimConfiguration buildNeovim;
}
