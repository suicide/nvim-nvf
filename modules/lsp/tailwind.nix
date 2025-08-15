{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.tailwind = {
        enable = true;
      };
    };
  };
}
