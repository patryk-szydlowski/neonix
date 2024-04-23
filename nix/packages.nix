{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        treefmt = pkgs.callPackage ./packages/treefmt { };
      };
    };
}
