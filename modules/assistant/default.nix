{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./codecompanion
    ./mcphub
  ];

  config = {};
}
