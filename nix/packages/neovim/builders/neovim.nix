{
  lib,
  buildNeovimLoader,
  buildNeovimPlugins,
  neovimUtils,
  wrapNeovimUnstable,
  neovim-nightly-unwrapped,
  ...
}:
{
  wrapRC,
  customRC,
  plugins,
  extraPackages,
  ...
}:
let
  loaderPlugin = buildNeovimLoader { inherit plugins; };
  configuration = neovimUtils.makeNeovimConfig {
    inherit wrapRC customRC;
    withPython3 = false;
    withNodeJs = false;
    withRuby = false;
    plugins = buildNeovimPlugins { plugins = [ loaderPlugin ] ++ plugins; };
  };
  wrapperArgs = lib.strings.concatStringsSep " " [
    (lib.strings.escapeShellArgs configuration.wrapperArgs)
    ''--suffix PATH : ${lib.makeBinPath extraPackages}''
  ];
in
wrapNeovimUnstable neovim-nightly-unwrapped (configuration // { inherit wrapperArgs; })
