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
    forEachSystem = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
    ];
  in {
    packages = forEachSystem (system: let
      pkgs = inputs.nixpkgs.legacyPackages.${system};

      # Evaluate any and all modules to create the wrapped Neovim package.
      neovimConfigured = {extraConfig ? {}}:
        (inputs.nvf.lib.neovimConfiguration
          {
            inherit pkgs;

            modules = [
              ./modules/default.nix

              # overwrite
              {
                config.vim = extraConfig;
              }
            ];
          }).neovim;
    in {
      # Packages to be exposed under packages.<system>. Those can accessed
      # directly from package outputs in other flakes if this flake is added
      # as an input. You may run those packages with 'nix run .#<package>'
      # default = self.packages.${system}.neovim;
      default = neovimConfigured {};
      neovimConfigured = neovimConfigured {};

      neovimCustom = neovimConfigured;
    });
  };
}
