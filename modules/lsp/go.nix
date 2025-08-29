{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.go = {
        enable = true;
      };
    };
  };
}
