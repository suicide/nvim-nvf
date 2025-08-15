{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.java = {
        enable = true;
      };
    };
  };
}
