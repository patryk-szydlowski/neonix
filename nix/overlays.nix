{ inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ (_: pkgs: { treefmt = pkgs.callPackage ./overlays/treefmt.nix { }; }) ];
      };
    };
}
