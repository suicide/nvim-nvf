{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

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

      extraLuaFiles = [
        ./nvim-dap-visual.lua # dap visual customization
        ./nvim-dap-ui.lua
      ];
    };
  };
}
