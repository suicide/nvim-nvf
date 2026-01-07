# Configuration Modules

This directory contains the modular configuration for Neovim, split by concern.

## Directory Structure

| Module | Description |
|--------|-------------|
| `assistant/` | AI assistant configuration (CodeCompanion, Opencode, Mcphub). |
| `lsp/` | Language Server Protocol setups for various languages (Rust, Go, TS, etc.). |
| `common.nix` | Global editor settings (options, keymaps, indentation). |
| `default.nix` | The entry point that imports all other modules. |
| `autocomplete.nix` | Autocompletion settings (nvim-cmp or similar). |
| `autopairs.nix` | Automatic pairing of brackets/quotes. |
| `clipboard.nix` | Clipboard integration settings. |
| `comments.nix` | Comment toggling functionality. |
| `diagnostics.nix` | UI for showing errors and warnings. |
| `filetree.nix` | File explorer configuration (neo-tree/nvim-tree). |
| `format.nix` | Auto-formatting configuration (conform, etc.). |
| `gitsigns.nix` | Git integration in the gutter. |
| `lualine.nix` | Status line configuration. |
| `navigation.nix` | Navigation tools and mappings. |
| `quickfixlist.nix` | Quickfix list enhancements. |
| `snacks.nix` | Integration with `folke/snacks.nvim`. |
| `surround.nix` | Surround actions (quotes, brackets). |
| `telescope.nix` | Fuzzy finder configuration. |
| `treesitter.nix` | Syntax highlighting and parsing. |
| `undotree.nix` | Undo history visualizer. |

## Customization

To disable or modify a module, you can edit the corresponding file. Most modules export a configuration block:

```nix
config.vim.someModule = {
  enable = true;
  # ... options
};
```

If you are using this flake as an input, you can override these settings via `extraConfig` without modifying these files directly.
