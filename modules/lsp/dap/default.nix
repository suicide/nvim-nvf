{
  lib,
  pkgs,
  config,
  options,
  ...
}: let
  dapVisualLua = builtins.readFile ./nvim-dap-visual.lua;
  dapUiLua = builtins.readFile ./nvim-dap-ui.lua;
in {

  config = {
    vim = {
      debugger = {
        nvim-dap = {
          ui = {
            enable = true;
            autoStart = true;
          };
        };
      };

      extraPlugins = {
        "nvim-dap-virtual-text" = {
          package = pkgs.vimPlugins.nvim-dap-virtual-text;
          after = [ "nvim-dap" ];
          setup = ''
            require("nvim-dap-virtual-text").setup({
              only_first_definition = false,
              all_references = true,
            })
          '';
        };
      };

      luaConfigRC.dap = ''
        ${dapVisualLua}

        ${dapUiLua}
      '';
    };
  };
}
