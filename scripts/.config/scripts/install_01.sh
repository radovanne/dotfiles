#! /bin/bash
set -e

sudo pacman -Syu

sudo pacman -S --needed --noconfirm git base-devel libfido2 unzip


# Check if rustup is installed
if ! command -v rustup &>/dev/null; then
    echo "Rustup not found. Installing Rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Source ~/.bashrc"
    source ~/.bashrc
    rustup update
else
    echo "Rustup is already installed. Skipping installation."
fi

echo "Installing Paru"
if ! command -v paru &> /dev/null; then
    git clone https://aur.archlinux.org/paru.git
    mv paru ~/paru
    cd ~/paru
    makepkg -si
    cd ~/
else
  echo "Paru is already installed, skipping AUR helper installation."
fi

# Install Discord, Chromium, Pipewire, WirePlumber, Tar, Github Cli, Alacritty, Brigthnessctl
# Pamixer, Tmux, Waybar, Cliphist, Fzf, Tree
sudo pacman -S discord chromium pipewire wireplumber tar github-cli alacritty brightnessctl pamixer tmux waybar cliphist fzf tree --noconfirm

# Install nerd fonts
sudo pacman -S ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono

paru -S brave-bin slack-desktop zulip-desktop apvlv

echo "Installing Clojure"
paru -S jdk21-temurin
sudo pacman -S rlwrap
cd ~/
curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
chmod +x linux-install.sh
sudo ./linux-install.sh
rm -fr linux-install.sh 

echo "Installing C"
sudo pacman -S clang

echo "Installing Ruby"
paru -S rbenv ruby-build

echo "Installing Golang"
sudo pacman -S go

echo "Installing Python"
sudo pacman -S python-pip

echo "Installing Ocaml"
sudo pacman -S opam
opam init -y
eval $(opam env)

echo "Installing dependencies for Neovim"
# Install neovim plugins
sudo pacman -S viu chafa ueberzugpp luarocks tree-sitter-cli mercurial
paru -S clojure-lsp-bin
curl -fsSL https://install.julialang.org | sh

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
