{ self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        neovim = pkgs.callPackage ./packages/neovim { } {
          src = self;
          wrap = true;
        };
        neovim-unwrapped = pkgs.callPackage ./packages/neovim { } {
          src = self;
          wrap = false;
        };
      };
    };
}
