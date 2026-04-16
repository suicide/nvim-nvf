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
        enable = false; # disabled until https://github.com/NotAShelf/nvf/pull/1517 is resolved
      };
    };
  };
}
