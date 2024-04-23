{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        inputsFrom = [
          config.pre-commit.devShell
          config.treefmt.build.devShell
        ];

        packages = [ config.packages.neovim-unwrapped ];

        shellHook = ''
          export XDG_CONFIG_HOME=$(realpath .)
          export NVIM_APPNAME=.
          export EDITOR=nvim
          export VISUAL=nvim
        '';
      };
    };
}
