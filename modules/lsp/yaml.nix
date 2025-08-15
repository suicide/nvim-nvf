{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.yaml = {
        enable = true;
      };
    };
  };
}
