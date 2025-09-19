{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      navigation = {
        harpoon = {
          enable = true;
        };
      };
    };
  };
}


