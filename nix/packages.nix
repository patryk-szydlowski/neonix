{ self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        neovim = pkgs.callPackage ./packages/neovim/wrapped.nix { } { src = self; };
        neovim-unwrapped = pkgs.callPackage ./packages/neovim/unwrapped.nix { };
      };
    };
}
