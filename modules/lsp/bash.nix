{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.bash = {
        enable = true;
      };
    };
  };
}
