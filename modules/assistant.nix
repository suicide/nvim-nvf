{
  lib,
  pkgs,
  config,
  options,
  ...
}: {
  config = {
    vim = {
      assistant = {
        copilot = {
          enable = true;

          mappings = {
            panel = {
              refresh = "ggr";
            };
          };
        };

        codecompanion-nvim = {
          enable = true;
          setupOpts = {
            adapters = lib.mkLuaInline '' 
              {
                http = {
                  gemini = function()
                    return require("codecompanion.adapters").extend("gemini", {
                      env = {
                        api_key = function()
                        local key = os.getenv("GEMINI_API_KEY")

                          if key and key ~= "" then
                            return key
                          end

                          -- 2. If the first is empty, try to read GEMINI_API_KEY_FILE
                          local key_file_path = os.getenv("GEMINI_API_KEY_FILE")

                          if key_file_path and key_file_path ~= "" then
                            -- 3. Read the content of the file
                            local file = io.open(key_file_path, "r")
                            if file then
                              local content = file:read("*a")
                              file:close()

                              if content and content ~= "" then
                                return content
                              end
                            end
                          end

                          -- 5. Return empty string if no key is found
                          return ""
                        end,
                      },
                    })
                  end,
                },
              }
            '';

            strategies = {
              chat = {
                adapter = "gemini";
              };
              inline = {
                adapter = "gemini";
              };
            };
            display = {
              chat = {
                auto_scroll = true;
                show_settings = true;
              };
            };
          };
        };
      };

      lazy.plugins = {
        blink-copilot = {
          package = pkgs.vimPlugins.blink-copilot;
        };

        # fix commands in codecompanion, TODO: add to upstream
        codecompanion-nvim = {
          cmd = ["CodeCompanion" "CodeCompanionChat" "CodeCompanionCmd" "CodeCompanionActions"];
        };
      };
    };
  };
}
