{
  lib,
  pkgs,
  config,
  ...
}: {

  config = {
    vim = {

      statusline = {
        lualine = {
          enable = true;

          # activeSection.a = [
          #   ''
          #   'encoding', 'fileformat', 'filetype'
          #   ''
          # ];
          #
          # activeSection.c = [
          #   ''
          #   {
          #     'filename',
          #     path = 1,
          #   }
          #   ''
          # ];

          inactiveSection.c = [
            ''
            {
              'filename',
              path = 1,
            }
            ''
          ];

          globalStatus = false;

          refresh = {
            statusline = 100;
            tabline = 100;
            winbar = 100;
          };
        };
      };

      ## dev icons
      visuals.nvim-web-devicons.enable = true;
    };
  };
}
