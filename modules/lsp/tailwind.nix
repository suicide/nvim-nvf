{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      lsp.presets.tailwindcss-language-server = {
        enable = true;
      };
    };
  };
}
