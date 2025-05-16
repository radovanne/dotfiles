#! /bin/bash
set -e

sudo pacman -Syu

sudo pacman -S --needed --noconfirm git base-devel libfido2 unzip

# Install Discord, Chromium, Tar, Github Cli,
# Tmux, Fzf, Tree
sudo pacman -S discord chromium tar github-cli alacritty tmux fzf tree --noconfirm

paru -S brave-bin slack-desktop zulip-desktop apvlv

