#! /bin/bash
set -e

sudo pacman -Syu

sudo pacman -S --needed --noconfirm git base-devel libfido2 unzip

# Check if rustup is installed
if ! command -v rustup &>/dev/null; then
    echo "Rustup not found. Installing Rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Source ~/.zshrc"
    source ~/.zshrc
    rustup update
else
    echo "Rustup is already installed. Skipping installation."
fi

echo "Installing sdkman"
curl -s "https://get.sdkman.io" | bash
source "/home/ned/.sdkman/bin/sdkman-init.sh"

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
