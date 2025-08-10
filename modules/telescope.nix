{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      telescope = {
        enable = true;

        setupOpts = {
          defaults = {
            path_display = ["truncate"];
          };

          pickers.find_files.find_command = ["${pkgs.fd}/bin/fd" "--hidden"];
        };

        extensions = [
          {
            name = "fzf";
            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
            setup = {fzf = {fuzzy = true;};};
          }
        ];
      };

      lazy.plugins.telescope = {
        keys = [
          {
            mode = "n";
            key = "<C-p>";
            action = "<cmd>Telescope find_files<CR>";
            desc = "Quick find files";
          }
        ];
      };
    };
  };
}

