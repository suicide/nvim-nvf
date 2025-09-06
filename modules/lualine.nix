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
        activeB = options.vim.statusline.lualine.activeSection.b.default ;
      in {
        lualine = {
          enable = true;

          activeSection.a = [
            ''
              {
               "mode",
               icons_enabled = true,
              }
            ''
          ];

          activeSection.b = [
            ''
              {
                'branch',
                -- separator = {right = ''}
              }
            ''
            ''
              {
                'diff',
                -- separator = {right = ''}
              },
            ''
          ];

          activeSection.c = let
            firstEntry = builtins.head activeB;
          in  [
          firstEntry
          ''
            {
              "filename",
              path = 1,
              symbols = {modified = ' ', readonly = ' '},
              -- separator = {right = ''}
            }
          ''
          ];

          activeSection.y = [
          ''
            {
              'encoding',
              -- separator = {left = ''}
            }
          ''
          ''
            {
              "fileformat",
              -- color = {fg='black'},
              symbols = {
                unix = '', -- e712
                dos = '',  -- e70f
                mac = '',  -- e711
              }
            }
          ''
          ];

          activeSection.z = [
          ''
            {
              "progress",
              -- separator = {left = ''}
            }
          ''
          ''
            {"location"}
          ''
          ];

          inactiveSection.c = [
            ''
            {
              'filename',
              path = 1,
            }
            ''
          ];

          sectionSeparator = {
            left = "";
            right = "";
          };

          componentSeparator = {
            left = "";
            right = "";
          };

          # line on each window
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
