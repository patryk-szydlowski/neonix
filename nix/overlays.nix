{ inputs, ... }:
{
  perSystem =
    { inputs', system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          (_: pkgs: {
            json-language-server = pkgs.callPackage ./overlays/json-language-server.nix { };
            neovim-nightly-unwrapped = inputs'.neovim.packages.default;
            treefmt = pkgs.callPackage ./overlays/treefmt.nix { };
          })
        ];
      };
    };
}
