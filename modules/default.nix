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
    ./comments.nix

    ./assistant.nix

    ./lsp
    ./treesitter.nix
    ./autocomplete.nix
    ./format.nix

    ./quickfixlist.nix

    ./neotree.nix
    ./gitsigns.nix
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
