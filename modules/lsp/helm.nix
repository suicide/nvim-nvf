{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.helm = {
        enable = true;
      };
    };
  };
}
