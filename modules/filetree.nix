{
  lib,
  pkgs,
  config,
  options,
  ...
}: let
  oil-git = pkgs.vimUtils.buildVimPlugin {
    name = "oil-git";
    src = pkgs.fetchFromGitHub {
      owner = "benomahony";
      repo = "oil-git.nvim";
      rev = "d1f27a5982df35b70fb842aa6bbfac10735c7265";
      hash = "sha256-QQj3ck+5GpA/htG0tZzniS5bbfRscvcfXjMUjY8F9A4=";
    };
  };
  useOil-git = true;
  useOil-git-status = false;
in {

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

            win_options = {
              signcolumn = lib.mkIf useOil-git-status "yes:2";
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

      extraPlugins = lib.mkIf config.vim.utility.oil-nvim.enable {
        "oil-git" = lib.mkIf useOil-git {
          package = oil-git;
          after = [ "oil-nvim" ];
        };

        "oil-git-status" = lib.mkIf useOil-git-status {
          package = pkgs.vimPlugins.oil-git-status-nvim;
          setup = ''
            require("oil-git-status").setup()
          '';
          after = [ "oil-nvim" ];
        };
      };



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
