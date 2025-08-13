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
        enable = true;
      };
    };
  };
}

