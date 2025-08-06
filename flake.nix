{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    # An abstraction over systems to easily provide the same package
    # for multiple systems. This is preferable to abstraction libraries.
    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux"];
  in {
    packages = forEachSystem (system: let
      pkgs = inputs.nixpkgs.legacyPackages.${system};

      # A module to be evaluated via lib.evalModules inside nvf's module system.
      # All options supported by nvf will go under config.vim to create the final
      # wrapped package. You may also add some new *options* under options.* to
      # expand the module system.
      configModule = {
        # You may browse available options for nvf on the online manual. Please see
        # <https://notashelf.github.io/nvf/options.html>
        config.vim = {
        };
      };

      # Evaluate any and all modules to create the wrapped Neovim package.
      neovimConfigured = inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;

        modules = [
          # Configuration module to be imported. You may define multiple modules
          # or even import them from other files (e.g., ./modules/lsp.nix) to
          # better modularize your configuration.
          configModule
          ./modules/default.nix
        ];
      };
      nvim = neovimConfigured.neovim;
    in {
      # Packages to be exposed under packages.<system>. Those can accessed
      # directly from package outputs in other flakes if this flake is added
      # as an input. You may run those packages with 'nix run .#<package>'
      # default = self.packages.${system}.neovim;
      default = nvim;
      # neovimConfigured = neovimConfigured.neovim;
    });
  };

}
