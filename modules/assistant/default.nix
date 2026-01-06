{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./codecompanion
    ./mcphub
    ./opencode
  ];

  config = {};
}
