{
  lib,
  pkgs,
  config,
  options,
  ...
}: let
  # copilot.lua (as pinned by nvf) downloads the native language server at
  # runtime and extracts it with `unzip`, which is not available in the wrapped
  # Neovim's PATH. Point it at the nixpkgs-packaged server instead. The package
  # is unfree, so pull it from a scoped nixpkgs instance that only permits it.
  copilotLanguageServer =
    (import pkgs.path {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfreePredicate = pkg: lib.getName pkg == "copilot-language-server";
    }).copilot-language-server;
in {
  config = {
    vim = {
      assistant = {
        copilot = {
          enable = true;

          setupOpts.server = {
            type = "binary";
            custom_server_filepath = lib.getExe copilotLanguageServer;
          };

          mappings = {
            panel = {
              refresh = "ggr";
            };
          };
        };

        codecompanion-nvim = let
          defaultAdapter = "copilot";
        in {
          enable = false;
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

      extraPackages = [copilotLanguageServer];

      lazy.plugins = {
        blink-copilot = {
          package = pkgs.vimPlugins.blink-copilot;
        };

        codecompanion-nvim = lib.mkIf config.vim.assistant.codecompanion-nvim.enable {
          # fix commands in codecompanion, TODO: add to upstream
          cmd = ["CodeCompanion" "CodeCompanionChat" "CodeCompanionCmd" "CodeCompanionActions"];
        };
      };
    };
  };
}
