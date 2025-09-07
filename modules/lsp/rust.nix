{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.rust = {
        enable = true;

        dap = {
          # uses rustaceanvim and some hardcoded mappings bound to ',' <localleader>
          # ,rd -> to debug
          enable = true;
        };
      };
    };
  };
}
