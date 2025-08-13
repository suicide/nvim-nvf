{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      autocomplete = {
        blink-cmp = {
          enable = true;

          mappings = {
          };

          friendly-snippets.enable = true;

          sourcePlugins = {
            emoji = {
              enable = true;
            };
            spell.enable = true;
          };
        };
      };
    };
  };
}
