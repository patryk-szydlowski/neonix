{ vimPlugins, callPackage, ... }:
vimPlugins // { lazy-nix-helper = callPackage ./lazy-nix-helper.nix { }; }
