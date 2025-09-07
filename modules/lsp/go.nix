{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.go = {
        enable = true;
        format = {
          enable = true;
        };
        dap = {
          enable = true;
        };
      };
    };
  };
}
