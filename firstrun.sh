#!/bin/bash
# As of 2023-09-14
echo "Installing nix..."
sh <(curl -L https://nixos.org/nix/install)
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
