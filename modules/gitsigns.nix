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

          previewHunk = "<leader>hp";
        };
      };

      treesitter = {
        grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          git_config
          git_rebase
          gitattributes
          gitcommit
          gitignore
        ];
      };

    };
  };
}
