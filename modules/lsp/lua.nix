{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.lua = {
        enable = true;
      };
    };
  };
}
