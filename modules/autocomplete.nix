{
  lib,
  pkgs,
  config,
  options,
  ...
}: {
  config = {
    vim = {
      autocomplete = {
        blink-cmp = {
          enable = true;

          mappings = {
          };

          friendly-snippets.enable = true;

          sourcePlugins = {
            emoji = {
              enable = true;
            };
            spell.enable = true;
          };

          setupOpts = {
            sources = {
              default = [
                "copilot"
                "lsp" # Language Server suggestions
                "path" # File path suggestions
                "snippets" # Snippet suggestions (from friendly-snippets)
                "buffer" # Words from the current buffer
                "emoji"
                # "spell" # Words from the spell checker dictionary
              ];

              providers = {
                copilot = {
                  name = "copilot";
                  module = lib.mkForce "blink-copilot";
                  score_offset = 100;
                  async = true;
                };

                lsp = {
                  score_offset = 50;
                };

                snippets = {
                  score_offset = 30;
                };

                path = {
                  score_offset = 10;
                };

                buffer = {
                  min_keyword_length = 5;
                  score_offset = 1;
                };
                spell = {
                  min_keyword_length = 5;
                  score_offset = 1;
                };
              };
            };

            cmdline = {
              enabled = true;
              keymap = {
                # accept a suggestion in command line, this was missing before
                "<C-y>" = ["select_and_accept" "fallback"];
              };
            };
          };
        };
      };
    };
  };
}
