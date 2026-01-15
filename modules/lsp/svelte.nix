{
  lib,
  pkgs,
  config,
  options,
  ...
}: {
  config = {
    vim = {
      languages.svelte = {
        enable = true;
      };

      # temporary fix for proper highlighting of svelte files
      # see https://github.com/NotAShelf/nvf/pull/1315#issuecomment-3728427584
      startPlugins = with pkgs.vimPlugins.nvim-treesitter.queries; [ecma html_tags jsx];
    };
  };
}
