{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      diagnostics.nvim-lint = {
        enable = true;
      };
    };
  };
}

