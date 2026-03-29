{
  lib,
  pkgs,
  config,
  options,
  flakeInputs,
  ...
}: let
  cfg = config.__cfg.codecompanion.mcphub;
in {
  options = {
    __cfg.codecompanion.mcphub = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable mcp for codecompanion";
      };
    };
  };
  config = {
    vim = lib.mkIf (cfg.enable && config.vim.assistant.codecompanion-nvim.enable) {
      lazy.plugins = {
        "mcphub.nvim" = {
          package = flakeInputs.mcphub-nvim.packages.${pkgs.stdenv.hostPlatform.system}.default;
          setupModule = "mcphub";
          setupOpts = {
            cmd = "${flakeInputs.mcphub.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/mcp-hub";
          };
        };
      };

      assistant.codecompanion-nvim = {
        setupOpts = {
          extensions = {
            mcphub = {
              callback = "mcphub.extensions.codecompanion";
              opts = {
                make_tools = true;
                make_vars = true;
                make_slash_commands = true;
                show_server_tools_in_chat = true;
                show_result_in_chat = true;
              };
            };
          };
        };
      };
    };
  };
}
