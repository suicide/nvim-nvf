{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      assistant.copilot = {
        enable = true;
      };

      lazy.plugins.blink-copilot = {
        package = pkgs.vimPlugins.blink-copilot;
      };

    };
  };
}

