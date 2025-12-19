{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.just = {
        enable = true;
      };
    };
  };
}
