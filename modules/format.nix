{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      formatter.conform-nvim = {
        enable = true;
      };

      # use conform as the quasi default for formatting
      keymaps = [
        {
          key = "<leader>F";
          mode = ["n"];
          lua = true;
          action = ''
            function()
              require("conform").format({ async = true })
            end
          '';
          desc = "Format with conform-nvim";
        }
      ];
    };
  };
}

