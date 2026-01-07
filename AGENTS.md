# Agent Navigation Guide (AGENTS.md)

This file is a guide for AI agents (Claude, GitHub Copilot, Opencode, etc.) to understand, navigate, and modify this `nvim-nvf` repository safely.

## Project Summary
This repository is a **Nix-based Neovim configuration** built using the **`nvf` (Neovim Flake)** framework. It defines a reproducible Neovim environment using modular Nix files.

- **Primary Language:** Nix
- **Embedded Language:** Lua (inside Nix strings)
- **Framework:** `nvf` (https://github.com/notashelf/nvf)

## Architecture & Patterns

### Directory Structure
The core configuration lives in the `modules/` directory.
- `modules/` - Feature-specific configuration modules.
- `modules/lsp/` - Language Server Protocol configurations (one file per language).
- `modules/assistant/` - AI assistant integrations.
- `modules/common.nix` - Global settings, keymaps, and core options.

### Standard Module Pattern
Most files in `modules/` follow a standard structure:

1.  **Inputs:** `{ lib, pkgs, config, options, ... }`
2.  **Configuration:** A `config` block that modifies the `vim` namespace provided by `nvf`.
3.  **Conditionals:** Usage of `lib.mkIf` to enable config only when specific flags are true.

**Example Pattern:**
```nix
{ lib, pkgs, config, ... }: {
  config = {
    vim = {
      # 1. Enable standard nvf options
      languages.rust.enable = true;

      # 2. Add custom plugins
      lazy.plugins = {
        "some-plugin" = {
          package = pkgs.vimPlugins.some-plugin;
          setupOpts = { ... };
        };
      };
    };
  };
}
```

### Plugin Management
Plugins are managed via Nix (Nixpkgs) but configured via Lua (lazy.nvim).
- **Adding Plugins:** Use `vim.lazy.plugins`.
- **Source:** Prefer `pkgs.vimPlugins.<name>` from Nixpkgs.
- **Config:** Use `setupOpts` (Lua table -> Nix set) or `setupModule` (Lua require string).

## Navigation Map

| Capability | Directory / File | Description |
| :--- | :--- | :--- |
| **LSP / Languages** | `modules/lsp/*.nix` | Language-specific setup (e.g., `rust.nix`, `ts.nix`). |
| **AI Assistants** | `modules/assistant/` | Configuration for AI tools. |
| **Opencode** | `modules/assistant/opencode/` | Integration for the Opencode agent. |
| **MCP Hub** | `modules/assistant/mcphub/` | Model Context Protocol integration. |
| **Global Settings** | `modules/common.nix` | Editor options (`vim.opt`), globals (`mapleader`), and default keymaps. |
| **UI Components** | `modules/*.nix` | Root modules like `lualine.nix`, `telescope.nix`. |

## Modification Guidelines ("The Rules")

1.  **Check Existing Options First**: Before adding raw Lua or manual plugin config, check if `nvf` or existing modules provide a high-level option (e.g., `vim.languages.<lang>.enable`).
2.  **Plugin Sources**: Always prefer `pkgs.vimPlugins` for stability. Only use flake inputs or git sources if absolutely necessary.
3.  **Lua Embedding**: Lua code is frequently embedded in Nix multi-line strings (`'' ... ''`). Ensure proper escaping (`${` needs escaping in Nix if not a variable interpolation).
    *   *Tip:* Use `lua = true` in keymap definitions.
4.  **Formatting**: Respect the indentation of the surrounding Nix code (usually 2 spaces).
5.  **Safety**: Do not modify `flake.nix` or `flake.lock` unless explicitly requested to update dependencies.

## Special Context

### Opencode
This repo integrates **Opencode**, a localized AI agent.
- Config location: `modules/assistant/opencode/default.nix`
- Key options: `__cfg.opencode.enable`

### MCP Hub
This repo uses **MCP Hub** to connect Neovim to external context via the Model Context Protocol.
- It hooks into `codecompanion` to provide tools and context to the AI assistant.
