{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      lazy.plugins = {
        undotree = {
          package = pkgs.vimPlugins.undotree;

          # load on event
          event = ["BufEnter"];

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

