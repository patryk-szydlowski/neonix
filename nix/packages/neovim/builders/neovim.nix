{
  lib,
  buildNeovimLoader,
  buildNeovimConfiguration,
  buildNeovimPlugins,
  neovimUtils,
  wrapNeovimUnstable,
  neovim-unwrapped,
  ...
}:
{
  src,
  wrap,
  extraPlugins,
  extraPackages,
  ...
}:
let
  loaderPlugin = buildNeovimLoader { plugins = extraPlugins; };
  configurationPlugin = buildNeovimConfiguration { inherit src; };
  configuration = neovimUtils.makeNeovimConfig {
    withPython3 = false;
    withNodeJs = false;
    withRuby = false;
    wrapRC = wrap;
    customRC = if wrap then ":luafile ${src}/init.lua" else ":luafile init.lua";
    plugins = buildNeovimPlugins {
      plugins = [ loaderPlugin ] ++ (lib.lists.optional wrap configurationPlugin) ++ extraPlugins;
    };
  };
  wrapperArgs = lib.strings.concatStringsSep " " [
    (lib.strings.escapeShellArgs configuration.wrapperArgs)
    ''--suffix PATH : ${lib.makeBinPath extraPackages}''
  ];
in
wrapNeovimUnstable neovim-unwrapped (configuration // { inherit wrapperArgs; })
