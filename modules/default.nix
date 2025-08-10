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
    ./treesitter.nix

    ./quickfixlist.nix

    ./neotree.nix
    ./undotree.nix

    ./telescope.nix
    ./lualine.nix
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
