{ vimUtils, ... }:
{ src, ... }:
vimUtils.buildVimPlugin {
  pname = "neovim-configuration";
  version = "v0.0.0";
  inherit src;
}
