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

        registers = "";

        providers = {
          wl-copy = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
            enable = true;
          };
        };
      };
    };
  };
}

