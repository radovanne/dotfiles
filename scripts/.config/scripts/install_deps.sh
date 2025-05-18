#! /bin/bash
set -e

sudo pacman -Syu

sudo pacman -S --needed --noconfirm git base-devel libfido2 unzip

# Install FastFetch, Gimp, Tldr Tar, Github Cli, Alacritty, Brigthnessctl
# Pamixer, Tmux, Fzf, Tree
sudo pacman -S xdg-desktop-portal fastfetch gimp tldr tar github-cli alacritty brightnessctl pamixer tmux fzf tree --noconfirm

echo "Installing dependencies for Neovim"
# Install neovim plugins
sudo pacman -S viu chafa ueberzugpp luarocks tree-sitter-cli mercurial
paru -S clojure-lsp-bin
curl -fsSL https://install.julialang.org | sh
