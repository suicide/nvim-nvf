{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.html = {
        enable = true;
      };
    };
  };
}
