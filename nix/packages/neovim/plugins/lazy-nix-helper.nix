{ vimUtils, fetchFromGitHub, ... }:
vimUtils.buildVimPlugin {
  name = "lazy-nix-helper.nvim";
  src = fetchFromGitHub {
    owner = "b-src";
    repo = "lazy-nix-helper.nvim";
    rev = "v0.4.0";
    sha256 = "TBDZGj0NXkWvJZJ5ngEqbhovf6RPm9N+Rmphz92CS3Q=";
  };
}
