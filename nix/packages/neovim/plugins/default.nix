{ vimPlugins, callPackage, ... }:
vimPlugins
// {
  github-nvim-theme = callPackage ./github-nvim-theme.nix { };
  lazy-nix-helper = callPackage ./lazy-nix-helper.nix { };
}
