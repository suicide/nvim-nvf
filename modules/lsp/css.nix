{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.css = {
        enable = true;
      };
    };
  };
}
