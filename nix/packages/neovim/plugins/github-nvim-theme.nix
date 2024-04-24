{ vimUtils, fetchFromGitHub, ... }:
vimUtils.buildVimPlugin {
  pname = "github-nvim-theme";
  version = "2024-01-31";
  src = fetchFromGitHub {
    owner = "projekt0n";
    repo = "github-nvim-theme";
    rev = "d92e1143e5aaa0d7df28a26dd8ee2102df2cadd8";
    sha256 = "FO4mwRY2qjutjVTiW0wN5KVhuoBZmycfOwMFInaTnNo=";
  };
}
