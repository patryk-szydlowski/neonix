{ callPackage, ... }:
let
  buildNeovimConfiguration = callPackage ./builders/neovim-configuration.nix { };
  buildNeovim = callPackage ./builders/neovim.nix { inherit buildNeovimConfiguration; };
in
{
  inherit buildNeovimConfiguration buildNeovim;
}
