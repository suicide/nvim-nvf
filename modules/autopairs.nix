{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      autopairs.nvim-autopairs = {
        enable = true;
      };
    };
  };
}

