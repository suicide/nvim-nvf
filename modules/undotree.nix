{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      utility.undotree = {
        enable = true;
      };

      lazy.plugins = {
        undotree = {

          after = ''
            vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
            vim.opt.undofile = true
          '';

          # load on keymap
          keys = [
            {
              mode = "n";
              key = "<leader>u";
              action = "<cmd>UndotreeToggle<cr>";
              desc = "Toggle Undotree";
            }
          ];
        };
      };
    };
  };
}

