{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      git.gitsigns = {
        enable = true;

        mappings = {
          nextHunk = "]]";
          previousHunk = "[[";
        };
      };
    };
  };
}

