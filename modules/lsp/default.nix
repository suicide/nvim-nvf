{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./nix.nix

    ./markdown.nix
    ./yaml.nix

    ./bash.nix

    ./css.nix
    ./html.nix
    ./ts.nix
    ./svelte.nix
    ./tailwind.nix

    ./lua.nix
    ./java.nix
    ./rust.nix
    ./go.nix
    ./solidity.nix

    ./helm.nix
    ./terraform.nix
  ];

  config = {
    vim = {
      lsp = {
        # Enable LSP functionality globally. This is required for modules found
        # in `vim.languages` to enable relevant LSPs.
        enable = true;

        # You may define your own LSP configurations using `vim.lsp.servers` in
        # nvf without ever needing lspconfig to do it. This will use the native
        # API provided by Neovim > 0.11
        servers = {};

        formatOnSave = false;

        mappings = {
          # format = "<leader>F"; # use conform instead, but have nvf default anyway

          nextDiagnostic = "}}";
          previousDiagnostic = "{{";
          openDiagnosticFloat = "<leader>e";

          codeAction = "<leader>ca";
          renameSymbol = "<leader>rn";
        };
      };

      # Language support and automatic configuration of companion plugins.
      # Note that enabling, e.g., languages.<lang>.diagnostics will automatically
      # enable top-level options such as enableLSP or enableExtraDiagnostics as
      # they are needed.
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        enableDAP = true;
      };

      diagnostics = {
        enable = true;
        config = {
          # virtual_lines = true;
          virtual_text = true;
        };
      };

      debugger = {
        nvim-dap = {
          ui = {
            enable = true;
            autoStart = true;
          };
        };
      };

      extraPlugins = {
        "nvim-dap-virtual-text" = {
          package = pkgs.vimPlugins.nvim-dap-virtual-text;
          after = [ "nvim-dap" ];
          setup = ''
            require("nvim-dap-virtual-text").setup({
              only_first_definition = false,
              all_references = true,
            })
          '';
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>cl";
          action = "function() vim.lsp.codelens.run() end";
          lua = true;
          desc = "Code Lens";
        }
      ];
    };
  };
}
