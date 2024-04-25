{ lib, vimUtils, ... }:
{ src, ... }:
vimUtils.buildVimPlugin {
  pname = "neovim-configuration";
  version = "v0.0.1";
  src = lib.pipe src [
    lib.sources.cleanSource
    (lib.flip lib.sources.sourceFilesBySuffices [ ".lua" ])
  ];
}
