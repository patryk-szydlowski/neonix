{
  lib,
  buildNeovimLoader,
  buildNeovimPlugins,
  neovimUtils,
  wrapNeovimUnstable,
  neovim-unwrapped,
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
wrapNeovimUnstable neovim-unwrapped (configuration // { inherit wrapperArgs; })
