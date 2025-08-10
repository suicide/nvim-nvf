{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {

      keymaps = [
        {
          key = "<C-j>";
          mode = ["n" "v" "o"];
          action = ":cnext<CR>";
          desc = "Next quickfix item";
        }
        {
          key = "<C-k>";
          mode = ["n" "v" "o"];
          action = ":cprev<CR>";
          desc = "Previous quickfix item";
        }
      ];
    };
  };
}

