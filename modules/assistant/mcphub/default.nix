{
  lib,
  pkgs,
  config,
  options,
  otherInputs,
  ...
}: {
  config = {
    vim = {
      lazy.plugins = {
        "mcphub.nvim" = {
          package = otherInputs.mcphub-nvim.packages.${pkgs.system}.default;
          setupModule = "mcphub";
          setupOpts = {
            cmd = "${otherInputs.mcphub.packages.${pkgs.system}.default}/bin/mcp-hub";
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
