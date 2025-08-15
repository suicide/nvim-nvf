{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.rust = {
        enable = true;
      };
    };
  };
}
