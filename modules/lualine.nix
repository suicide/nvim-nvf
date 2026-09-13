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

          setupOpts = {
            sections = {
              lualine_a = map lib.generators.mkLuaInline [
                ''
                  {
                   "mode",
                   icons_enabled = true,
                  }
                ''
              ];

              lualine_b = map lib.generators.mkLuaInline [
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

              lualine_c = [
                {
                  "@1" = "filetype";
                  colored = true;
                  icon_only = true;
                  icon = {align = "left";};
                }
                (lib.generators.mkLuaInline ''
                  {
                    "filename",
                    path = 1,
                    symbols = {modified = ' ', readonly = ' '},
                    -- separator = {right = ''}
                  }
                '')
              ];

              lualine_y = map lib.generators.mkLuaInline [
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

              lualine_z = map lib.generators.mkLuaInline [
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
            };

            inactive_sections.lualine_c = map lib.generators.mkLuaInline [
              ''
                {
                  'filename',
                  path = 1,
                }
              ''
            ];

            options = {
              section_separators = {
                left = "";
                right = "";
              };

              component_separators = {
                left = "";
                right = "";
              };

              # line on each window
              globalstatus = false;

              refresh = {
                statusline = 100;
                tabline = 100;
                winbar = 100;
              };
            };
          };
        };
      };

      ## dev icons
      visuals.nvim-web-devicons.enable = true;
    };
  };
}
