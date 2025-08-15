{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.markdown = {
        enable = true;
        format.enable = true; # use conform
      };
    };
  };
}
