{
  lib,
  pkgs,
  config,
  ...
}: {




  imports = [
    ./common.nix

    ./lsp
    ./lualine.nix

    ./neotree.nix
    ./undotree.nix
  ];

  config = {

    vim = {

      # themes
      theme.enable = true;
      theme.name = "tokyonight";
      theme.style = "night";
    };
  };
}
