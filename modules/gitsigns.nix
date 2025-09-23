{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      git.gitsigns = {
        enable = true;

        mappings = {
          nextHunk = "]]";
          previousHunk = "[[";
        };
      };

      treesitter = {
        grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [ 
          git_rebase
          gitattributes
          gitcommit
          gitignore
        ];
      };
    };
  };
}

