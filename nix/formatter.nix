{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";

        package = pkgs.writeShellApplication {
          name = "treefmt";
          runtimeInputs = [ pkgs.treefmt ];
          text = ''treefmt --hidden "$@"'';
        };

        programs = {
          deadnix.enable = true;
          jsonfmt.enable = true;
          nixfmt-rfc-style.enable = true;
          shellcheck.enable = true;
          shfmt.enable = true;
          statix.enable = true;
          stylua.enable = true;
          taplo.enable = true;
          yamlfmt.enable = true;
        };

        settings.formatter = {
          shellcheck.includes = [ ".envrc" ];
          shfmt.includes = [ ".envrc" ];
        };
      };
    };
}
