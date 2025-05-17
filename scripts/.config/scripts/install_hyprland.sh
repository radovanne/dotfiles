#! /bin/bash
set -e

sudo pacman -Syu

sudo pacman -S --needed --noconfirm git base-devel libfido2 unzip

# Install Waybar, Cliphist 
sudo pacman -S waybar cliphist --noconfirm

echo "Installing dependencies for TOFI"
# Runtime dependencies
sudo pacman -S freetype2 harfbuzz cairo pango wayland libxkbcommon

# Build-time dependencies
sudo pacman -S meson scdoc wayland-protocols

echo "Installing TOFI"
paru -S tofi

echo "Installing Hyprpicker"
paru -S hyprpicker

echo "Installing Hyprlock"
paru -S hyprlock

echo "Installing Hypridle"
paru -S hypridle

echo "Install Wlogout"
paru -S wlogout

echo "Install Grimblast"
paru -S grimblast
