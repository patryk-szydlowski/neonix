{
  lib,
  vimUtils,
  buildEnv,
  ...
}:
{ plugins, ... }:
let
  pluginWithDependencies =
    plugin: [ plugin ] ++ lib.lists.concatMap pluginWithDependencies (plugin.dependencies or [ ]);
  pluginWithoutHelpTag =
    plugin:
    plugin.overrideAttrs (prev: {
      nativeBuildInputs = lib.lists.remove vimUtils.vimGenDocHook (prev.nativeBuildInputs or [ ]);
      configurePhase = ''
        ${prev.configurePhase or ""}
        rm -f doc/tags
        rm -rf queries
      '';
    });
  mergePlugins =
    paths:
    buildEnv {
      inherit paths;
      name = "neovim-plugins";
      postBuild = ''
        find $out -type d -empty -delete
        runHook preFixup
      '';
      pathsToLink = [
        "/autoload"
        "/colors"
        "/compiler"
        "/doc"
        "/ftplugin"
        "/indent"
        "/keymap"
        "/lang"
        "/lua"
        "/pack"
        "/parser"
        "/plugin"
        "/queries"
        "/rplugin"
        "/spell"
        "/syntax"
        "/tutor"
        "/types"
        "/after"
        "/ftdetect"
        "/data"
        "/build"
      ];
    };
in
lib.pipe plugins [
  (lib.lists.concatMap pluginWithDependencies)
  lib.lists.unique
  (lib.lists.map pluginWithoutHelpTag)
  mergePlugins
  vimUtils.toVimPlugin
  lib.lists.singleton
]
