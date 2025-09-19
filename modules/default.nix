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
    ./diagnostics.nix
    ./treesitter.nix
    ./autocomplete.nix
    ./format.nix

    ./navigation.nix

    ./quickfixlist.nix

    ./filetree.nix

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
