{ nodePackages, ... }:
nodePackages.vscode-json-languageserver.overrideAttrs {
  postInstall = ''
    mv $out/bin/vscode-json-languageserver $out/bin/vscode-json-language-server
  '';
}
