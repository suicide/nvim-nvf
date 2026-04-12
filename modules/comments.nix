{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      comments.comment-nvim = {
        enable = false;
      };

      mini.comment = {
        enable = true;
      };
    };
  };
}

