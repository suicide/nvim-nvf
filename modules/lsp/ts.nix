{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.ts = {
        enable = true;
      };
    };
  };
}
