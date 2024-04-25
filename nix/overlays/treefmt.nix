{
  lib,
  rustPlatform,
  fetchFromGitHub,
  ...
}:
rustPlatform.buildRustPackage {
  pname = "treefmt";

  version = "2024-04-19";

  src = fetchFromGitHub {
    owner = "numtide";
    repo = "treefmt";
    rev = "4dd19e6e43976ddf9a3af65fe17be2f367662ed0";
    sha256 = "OJOFa59mjzVCNrLUozUZgtm3MH9AdHn1o/BNLMfvd4k=";
  };

  cargoSha256 = "sha256-Hp9OT0/YZC+u4A0TL607X6UipblGd2Df2PYft+YhNsY=";

  meta = {
    description = "one CLI to format the code tree";
    homepage = "https://github.com/numtide/treefmt";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.zimbatm ];
  };
}
