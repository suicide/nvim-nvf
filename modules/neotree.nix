{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      filetree.neo-tree = {
        enable = true;

        setupOpts = {
          filesystem = {
            hijack_netrw_behavior = "open_current";

            filtered_items = {
              hide_dotfiles = false;
              hide_gitignored = false;
              hide_hidden = false;
            };
          };
        };
      };

      lazy.plugins."neo-tree-nvim".keys = [
        {
          mode = "n";
          key = "<C-t>";
          action = "<cmd>Neotree toggle<cr>";
          desc = "Toggle Neotree";
        }

        {
          mode = "n";
          key = "<C-f>";
          action = "<cmd>Neotree reveal<cr>";
          desc = "Find in Neotree";
        }
      ];
    };
  };
}
