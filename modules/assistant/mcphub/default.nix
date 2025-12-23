{
  lib,
  pkgs,
  config,
  options,
  flakeInputs,
  ...
}: {
  config = {
    vim = lib.mkIf config.vim.assistant.codecompanion-nvim.enable {
      lazy.plugins = {
        "mcphub.nvim" = {
          package = flakeInputs.mcphub-nvim.packages.${pkgs.system}.default;
          setupModule = "mcphub";
          setupOpts = {
            cmd = "${flakeInputs.mcphub.packages.${pkgs.system}.default}/bin/mcp-hub";
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
