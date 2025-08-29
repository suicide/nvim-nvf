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
              };
            };
          };
        };
      };
    };
  };
}
