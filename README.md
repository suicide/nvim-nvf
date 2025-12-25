## Neovim NVF Config

Run flake locally:

```bash
nix run . -- .
```

## Code

### Overriding a plugin package

Most of nvf's dependencies are pinned using npins. You can however, override a
plugin package with a package that is provided by nixpkgs.

You may have to change the pname as the name is used within nvf and may not
match.

```nix
  config.vim.lazy.plugins = {
    blink-copilot = {
      package = pkgs.vimPlugins.blink-copilot;
    };

    codecompanion-nvim = {
      # override npins package defined in nvf with nixpkgs version
      package = lib.mkForce (pkgs.vimPlugins.codecompanion-nvim.overrideAttrs (old: {
        # have to change pname
        pname = "codecompanion-nvim";
      }));
    };
  };
```
