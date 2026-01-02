{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      utility.surround = {
        enable = true;
      };
    };
  };
}

