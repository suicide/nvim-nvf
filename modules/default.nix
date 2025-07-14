{
  lib,
  pkgs,
  config,
  ...
}: {

  imports = [
    ./lualine.nix
    ./lsp
  ];
  config = {

  };
}
