{
  lib,
  pkgs,
  config,
  options,
  flakeInputs,
  ...
}: let
  cfg = config.__cfg.opencode;
in {
  options = {
    __cfg.opencode = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable opencode.nvim integration";
      };

      opencodePackage = lib.mkOption {
        type = lib.types.package;
        default = pkgs.opencode;
        description = "The opencode package to use";
      };
    };
  };

  config = {
    vim = lib.mkIf cfg.enable {
      lazy.plugins = {
        "opencode.nvim" = {
          package = pkgs.vimPlugins.opencode-nvim;

          keys = [
            {
              mode = ["n" "x"];
              key = "<leader>o";
              action = ''function() require("opencode").ask("@this: ", { submit = true }) end'';
              lua = true;
              desc = "Ask opencode";
            }
            {
              mode = ["n" "x"];
              key = "<leader>O";
              action = ''function() require("opencode").select() end'';
              lua = true;
              desc = "Execute opencode action…";
            }
            {
              mode = ["n" "t"];
              key = "<C-.>";
              action = ''function() require("opencode").toggle() end'';
              lua = true;
              desc = "Toggle opencode";
            }

            {
              mode = ["n" "x"];
              key = "<leader>go";
              action = ''function() return require("opencode").operator("@this ") end'';
              lua = true;
              expr = true;
              desc = "Add range to opencode";
            }
            {
              mode = ["n"];
              key = "<leader>goo";
              action = ''function() return require("opencode").operator("@this ") .. "_" end'';
              lua = true;
              expr = true;
              desc = "Add line to opencode";
            }

            {
              mode = ["n"];
              key = "<S-C-u>";
              action = ''function() require("opencode").command("session.half.page.up") end'';
              lua = true;
              desc = "opencode half page up";
            }
            {
              mode = ["n"];
              key = "<S-C-d>";
              action = ''function() require("opencode").command("session.half.page.down") end'';
              lua = true;
              desc = "opencode half page down";
            }
          ];
        };
      };

      extraPackages = with pkgs; [
        cfg.opencodePackage
        lsof # needed to find existing opencode instances
      ];

      # enable nicer interaction with opencode
      utility.snacks-nvim = {
        setupOpts = {
          input = {
            enabled = lib.mkForce true;
          };
          picker = {
            enabled = lib.mkForce true;
          };
          terminal = {
            enabled = lib.mkForce true;
          };
        };
      };
    };
  };
}
