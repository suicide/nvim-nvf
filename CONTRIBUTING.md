# Contributing to nvim-nvf

Thank you for your interest in contributing! This project relies on `nvf` (Neovim Flake) to manage the configuration.

## Development Workflow

1.  **Fork and Clone**:
    ```bash
    git clone https://github.com/yourusername/nvim-nvf
    cd nvim-nvf
    ```

2.  **Make Changes**:
    - Modify the Nix files in `modules/`.
    - If adding a new plugin, ensure it's available in `nixpkgs` or pinned via `nvf`'s plugin management.

3.  **Test Locally**:
    Run the configuration to ensure it builds and starts correctly:
    ```bash
    nix run .
    ```

4.  **Format Code**:
    Ensure your Nix code is formatted (standard `nixfmt` or `alejandra` is recommended).

## Directory Structure

- `modules/`: Contains all configuration modules.
- `modules/default.nix`: Main entry point.

## Adding a New Module

1.  Create a new `.nix` file in `modules/` (e.g., `modules/my-plugin.nix`).
2.  Define the configuration:
    ```nix
    { config, pkgs, ... }: {
      config.vim.somePlugin = {
        enable = true;
      };
    }
    ```
3.  Import it in `modules/default.nix`.

## Submitting a PR

- clear title and description of changes.
- If you added a new feature, mention it in the PR description.
