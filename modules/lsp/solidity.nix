{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = let
    solcExe = lib.getExe' pkgs.solc "solc";
    solidity_ls = let
      package = pkgs.vscode-solidity-server;
      exe = lib.getExe' package "vscode-solidity-server";
    in {
              # setting solc ?
              # compileUsingLocalVersion = "${solcExe}",
      lspConfig = ''
        lspconfig.solidity_ls.setup {
          capabilities = capabilities,
          on_attach = attach_keymaps,
          cmd = ${
            ''{"${exe}", "--stdio"}''
          },
          settings = {
            solidity = {
              enabledAsYouTypeCompilationErrorCheck = true,
              validationDelay = 1500,
            },
          },
        }
      '';
    };
    solc = let
      exe = solcExe;
    in {
      lspConfig = ''
        lspconfig.solidity_ls.setup {
          capabilities = capabilities,
          on_attach = attach_keymaps,
          cmd = ${
            ''{"${exe}", "--lsp"}''
          },
        }
      '';
    };
  in {
    vim = {
      treesitter = {
        grammars = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.solidity ];
      };

      lsp.lspconfig.sources.solidity_ls = solidity_ls.lspConfig;

      # lsp.lspconfig.sources.solc = solc.lspConfig;

      formatter.conform-nvim = {
        setupOpts = {
          formatters_by_ft.solidity = ["forge_fmt"];

          formatters.forge_fmt = {
            command = lib.getExe' pkgs.foundry "forge";
          };
        };
      };

      # TODO: There is no solhint package in nixpkgs
      # see https://github.com/NixOS/nixpkgs/pull/426905
      # diagnostics.nvim-lint = {
      #   linters_by_ft.solidity = ["solhint"];
      #   linters.solhint = {
      #     cmd = lib.getExe pkgs.solhint;
      #   };
      # };
    };
  };
}

