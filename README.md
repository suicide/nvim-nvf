# nvim-nvf

A comprehensive, modular Neovim configuration built using
[nvf](https://github.com/notashelf/nvf) (Neovim Flake). This project provides a
pre-configured Neovim environment managed via Nix, suitable for development
across various languages.

## Features

- **Package Management**: All plugins and dependencies managed by Nix.
- **Modular Design**: Configuration split into logical modules (LSP, UI, Tools,
  etc.) in the `modules/` directory.
- **LSP & Formatting**: Built-in support for Language Server Protocols and
  auto-formatting.
- **Assistant Integration**: configured with `codecompanion.nvim`, `copilot`, and `opencode`.
  See [AGENTS.md](./AGENTS.md) for navigation and usage guides.
- **Modern UI**: Tokyo Night theme, Lualine, Telescope, and Filetree
  integrations.
- **Git Integration**: Gitsigns and other git helpers.

## Getting Started

### Prerequisites

- [Nix](https://nixos.org/download.html) with flakes enabled.

### Run Locally

To try out the configuration without installing it, you can run it directly:

```bash
nix run .
# Or if running from a remote url (once pushed)
# nix run github:yourusername/nvim-nvf
```

## Installation

### As a Flake Input

You can add this repository as an input to your own system flake or home-manager
configuration to use this Neovim setup.

1. Add the input to your `flake.nix`:

   ```nix
   {
     inputs = {
       nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
       nvim-nvf.url = "github:suicide/nvim-nvf";
     };

     outputs = { self, nixpkgs, nvim-nvf, ... }: {
       # Your system configuration
     };
   }
   ```

2. Use the package in your configuration:

   ```nix
   # In your home-manager or nixos configuration
   environment.systemPackages = [
     inputs.nvim-nvf.packages.${pkgs.system}.default
   ];
   ```

### Extending / Customizing

You can override or extend the configuration by using the `neovimConfigured`
function exposed by the flake. This allows you to pass your own `extraConfig`
module.

```nix
{
  outputs = { self, nixpkgs, nvim-nvf, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    
    # Create a custom instance
    myNeovim = nvim-nvf.packages.${system}.neovimConfigured {
      extraConfig = {
        vim.theme.name = "catppuccin"; # Override theme
        vim.languages.rust.enable = true; # Enable Rust support
      };
    };
  in {
    packages.${system}.default = myNeovim;
  };
}
```

## Project Structure

The configuration is organized in the `modules/` directory:

- **`default.nix`**: The entry point that imports all other modules.
- **`common.nix`**: General settings (keymaps, options like relative numbers,
  indentation).
- **`lsp/`**: Language Server Protocol configurations.
- **`assistant/`**: AI assistant configurations (Copilot, CodeCompanion).
- **`ui/`** (implied): Theme, Lualine, Dashboard settings.
- **Individual modules**: `treesitter.nix`, `telescope.nix`, `gitsigns.nix`,
  etc.

## Customizing Modules

Most configuration is done via standard `nvf` options. You can inspect
individual files in `modules/` to see how features are enabled. For example,
`modules/common.nix` sets global vim options.

To modify the setup, you can either:

1. Fork this repository and edit the `modules/` directly.
2. Use the "Extending" method above to override settings without forking.

## Overriding Plugins

If you need to use a specific version of a plugin from `nixpkgs` instead of the
one pinned by `nvf` (or this flake), you can override it in your config:

```nix
config.vim.lazy.plugins = {
  some-plugin = {
    package = pkgs.vimPlugins.some-plugin;
  };
};
```
