{ inputs, ... }:
{
  imports = [ inputs.pre-commit-hooks-nix.flakeModule ];

  perSystem = {
    pre-commit.settings.hooks = {
      check-added-large-files.enable = true;
      check-case-conflicts.enable = true;
      check-merge-conflicts.enable = true;
      conform.enable = true;
      editorconfig-checker.enable = true;
      end-of-file-fixer.enable = true;
      flake-checker.enable = true;
      lua-ls.enable = true;
      nil.enable = true;
      typos.enable = true;
    };
  };
}
