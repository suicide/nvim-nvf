{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.typescript = {
        enable = true;
      };
    };
  };
}
