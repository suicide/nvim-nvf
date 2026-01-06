{
  lib,
  pkgs,
  config,
  options,
  flakeInputs,
  ...
}: let
  cfg = config.__cfg.opencode;
in {
  config = {
    vim = {
      utility.snacks-nvim = {
        enable = true;
      };
    };
  };
}
