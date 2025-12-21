{
  lib,
  pkgs,
  config,
  options,
  ...
}: {
  config = {
    vim = {
      assistant = {
        copilot = {
          enable = true;

          mappings = {
            panel = {
              refresh = "ggr";
            };
          };
        };

        codecompanion-nvim = let
          defaultAdapter = "copilot";
        in {
          enable = true;
          setupOpts = {
            adapters = let
              content = builtins.readFile ./adapters.lua;
              parts = lib.splitString "--[NIX_START]\n" content;
              rest =
                if lib.length parts > 1
                then builtins.elemAt parts 1
                else "";
              excerpt = lib.head (lib.splitString "\n--[NIX_END]" rest);
            in
              lib.generators.mkLuaInline excerpt;

            strategies = {
              chat = {
                adapter = defaultAdapter;
              };
              inline = {
                adapter = defaultAdapter;
              };
            };
            display = {
              chat = {
                auto_scroll = true;
                show_settings = false;
                show_token_count = true;
              };
            };
          };
        };
      };

      lazy.plugins = {
        blink-copilot = {
          package = pkgs.vimPlugins.blink-copilot;
        };

        # fix commands in codecompanion, TODO: add to upstream
        codecompanion-nvim = {
          cmd = ["CodeCompanion" "CodeCompanionChat" "CodeCompanionCmd" "CodeCompanionActions"];
        };
      };
    };
  };
}
