{ inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          (_: pkgs: {
            json-language-server = pkgs.callPackage ./overlays/json-language-server.nix { };
            treefmt = pkgs.callPackage ./overlays/treefmt.nix { };
          })
        ];
      };
    };
}
