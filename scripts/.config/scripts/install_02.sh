#! bin/bash 
set -e

sudo pacman -Syu

curl -sS https://starship.rs/install.sh | sh

# Add at the end of rc file eval "$(starship init bash)"
