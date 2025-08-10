{
  lib,
  pkgs,
  config,
  ...
}: {




  imports = [
    ./common.nix
    ./clipboard.nix

    ./autopairs.nix

    ./lsp
    ./lualine.nix

    ./quickfixlist.nix

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
