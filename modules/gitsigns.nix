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

      # temporary fix for proper highlighting of svelte files
      # see https://github.com/NotAShelf/nvf/pull/1315#issuecomment-3728427584
      startPlugins = with pkgs.vimPlugins.nvim-treesitter.queries; [
        git_config
        git_rebase
        gitattributes
        gitcommit
        gitignore
      ];
    };
  };
}
