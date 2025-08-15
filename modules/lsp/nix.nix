{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.nix = {
        enable = true;
      };
    };
  };
}
