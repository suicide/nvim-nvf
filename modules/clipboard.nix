{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      clipboard = {
        enable = true;

        registers = "unnamed,unnamedplus";

        providers = {
          wl-copy = {
            enable = true;
          };
        };
      };
    };
  };
}

