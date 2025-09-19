{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {

      utility = {
        oil-nvim = {
          enable = true;

          setupOpts = {

            columns = [
              "size"
              "icon"
            ];

            view_options = {
              show_hidden = true;
            };

            keymaps = {
              "<C-p>" = false; # we want to use telescope file finder instead
              "<M-p>" = "actions.preview";
            };
          };
        };
      };

      keymaps = lib.mkIf config.vim.utility.oil-nvim.enable [
        {
          mode = "n";
          key = "-";
          action = "<cmd>Oil<cr>";
          desc = "Oil parent";
        }
      ];


      filetree = {
        neo-tree = {
          enable = false;

          setupOpts = {
            filesystem = {
              hijack_netrw_behavior = "open_current";

              filtered_items = {
                hide_dotfiles = false;
                hide_gitignored = false;
                hide_hidden = false;
              };
            };

            git_status_async = true;
          };
        };
      };

      lazy.plugins = lib.mkIf config.vim.filetree.neo-tree.enable {
        "neo-tree-nvim" = {
          keys = [
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
    };
  };
}
