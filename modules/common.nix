{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      globals = {
        mapleader = " ";
      };

      lineNumberMode = "relNumber";
      bell = "none";

      # swapfile, backup
      preventJunkFiles = true;

      spellcheck = {
        enable = true;
        languages = [
          "en"
          "en_us"
        ];
      };

      options = {

        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        softtabstop = 2;

        autoindent = true;
        smartindent = true;

        scrolloff = 3;

        wrap = false;

        cursorline = true;
        colorcolumn = "80";

        smartcase = true;

        incsearch = true;

        termguicolors = true;

        hidden = true;

        updatetime = 200;

        cmdheight = 2;

        list = true;
        listchars = "tab:␉·,trail:·,nbsp:⎵";

        splitbelow = true;
        splitright = true;

      };

      luaConfigRC.common = ''
        vim.opt.shortmess:append("c")
      '';
    };
  };
}
