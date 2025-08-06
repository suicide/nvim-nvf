{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {

      statusline = let
        activeZ = options.vim.statusline.lualine.activeSection.z.default ;
      in {
        lualine = {
          enable = true;

          # activeSection.a = [
          #   ''
          #   'encoding', 'fileformat', 'filetype'
          #   ''
          # ];
          #
          activeSection.c = [
            ''
            {
              'diff',
            }
            ''
          ];

          activeSection.z = activeZ 
            ++
          [
            ''
            {
              'encoding',
            }
            ''
          ]
          ;

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
