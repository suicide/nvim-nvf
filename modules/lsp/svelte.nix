{
  lib,
  pkgs,
  config,
  options,
  ...
}: {
  config = {
    vim = {
      languages.svelte = {
        enable = true;
      };
    };
  };
}
