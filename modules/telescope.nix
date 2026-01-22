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
            file_ignore_patterns = lib.mkOptionDefault [
              "%.direnv/"
            ];
          };

          pickers = {
            find_files.find_command = [
              "${pkgs.fd}/bin/fd"
              "-tf"
              "--hidden"
              "--no-ignore-vcs"
            ];

            buffers = {
              mappings = {
                i = {
                  "<M-d>" = "delete_buffer";
                };
              };
            };
          };
        };

        extensions = [
          {
            name = "fzf";
            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
            setup = {fzf = {fuzzy = true;};};
          }
        ];

        mappings = {
          diagnostics = "<leader>Q"; # workspace diagnostics
          lspDefinitions = "gd";
          lspTypeDefinitions = "gD";
          lspImplementations = "gi";
          lspReferences = "<leader>gr";
          lspDocumentSymbols = "gs";
          lspWorkspaceSymbols = "gS";

          gitBranches = "<leader>gcb";
          gitBufferCommits = "<leader>ggl";
          gitCommits = "<leader>glg";
          gitStash = "<leader>ggx";
          gitStatus = "<leader>ggs";
        };
      };

      lazy.plugins.telescope = {
        keys = [
          {
            mode = "n";
            key = "<C-p>";
            action = "<cmd>Telescope find_files<CR>";
            desc = "Quick find files";
          }
          {
            mode = "n";
            key = "<leader>q";
            action = "function() require('telescope.builtin').diagnostics({bufnr=0}) end";
            lua = true;
            desc = "Buffer diagnostics";
          }
        ];
      };
    };
  };
}
