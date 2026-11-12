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
    # nixpkgs' `cargoSetupHook` forces system libraries, but the `foundry`
    # derivation does not provide them, so `aws-lc-sys` and `zstd-sys` fail to
    # build. Add the missing inputs, mirroring the upstream fix, until it lands.
    # See https://github.com/NixOS/nixpkgs/pull/587157
    forgePkg = pkgs.foundry.overrideAttrs (old: {
      buildInputs = (old.buildInputs or []) ++ [
        pkgs.aws-lc
        pkgs.rust-jemalloc-sys
        pkgs.sqlite
        pkgs.zstd
      ];
    });
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
            command = lib.getExe' forgePkg "forge";
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

