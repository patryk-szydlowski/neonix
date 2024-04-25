{
  lib,
  vimUtils,
  writeTextDir,
  ...
}:
{ plugins, ... }:
let
  luaPluginName =
    plugin:
    lib.trivial.pipe plugin [
      lib.strings.getName
      (lib.strings.removePrefix "vimplugin-")
      (lib.strings.removePrefix "lua5.1-")
      (lib.strings.removeSuffix "-nvim")
      (builtins.replaceStrings [ "_" ] [ "-" ])
    ];
  luaPluginPathEntry = plugin: ''["${luaPluginName plugin}"] = "${plugin.outPath}"'';
  luaPluginPathEntries = lib.strings.concatMapStringsSep ",\n " luaPluginPathEntry;
in
vimUtils.buildVimPlugin {
  pname = "neovim-loader";
  version = "v0.0.0";
  src = writeTextDir "lua/loader/paths.lua" ''
    return {${luaPluginPathEntries plugins}}
  '';
}
