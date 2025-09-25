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

        mappings = {
          panel = {
            refresh = "ggr";
          };
        };
      };

      lazy.plugins.blink-copilot = {
        package = pkgs.vimPlugins.blink-copilot;
      };
    };
  };
}
