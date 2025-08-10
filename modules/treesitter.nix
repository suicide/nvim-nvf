{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {

      treesitter = {
        # enabled via language support
        # enable = true;

        context = {
          enable = true;
        };

        highlight = {
          enable = true;
          additionalVimRegexHighlighting = true;
        };

        autotagHtml = true;
      };

    };
  };
}

