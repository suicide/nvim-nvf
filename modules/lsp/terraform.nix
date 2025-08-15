{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.terraform = {
        enable = true;
      };
    };
  };
}
