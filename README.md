# lua-neovim-config

## Overview

My eternal ricing of neovim

## Dependecies

To run this config you'll to install this language servers:
- lua-language-server (https://github.com/sumneko/lua-language-server/)
- terraform-ls (https://github.com/hashicorp/terraform-ls)
- yaml-language-server (https://github.com/redhat-developer/yaml-language-server)
- bash-languague-server (https://github.com/bash-lsp/bash-language-server)

## Packer Bootstrapping
Packer is the plugin manager used in my configurations. To use it, you'll need to bootstrap it with this command:
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```

## Installation

In your home directory, create a new directory inside ".config/" called "nvim"
```
mkdir .config/nvim
```
Now you clone the repo inside that directory with:
```
git clone https://github.com/0ur0b0r0s/neovim-config .config/nvim
```
