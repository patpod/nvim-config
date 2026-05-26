# My NeoVim Configuration 

This configuration is based on [LazyVim](https://github.com/LazyVim/LazyVim).

## Nix Setup

When using this config with nix I just use this repo as a flake input:

```
inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  # ... other inputs ...
  my-nvim-config = {
    url = "github:patpod/nvim-config";
    flake = false;
  };
};
```

In my home neovim home manager module I reference the config like this:

```
{ inputs, ... }:

{
  xdg.configFile."nvim".source = inputs.my-nvim-config;
}
```

Changes to this config are made through a development instance. I works
like a gitops workflow where changes are tested on the development
instance, then committed and applied by updating the flake input.

Create an alias for the dev instance:

```
alias nvim-dev='NVIM_APPNAME=nvim-config-dev nvim'
```

And link the project folder to the default config location:

```
ln -s ~/Projects/nvim-config ~/.config/nvim-config-dev
```