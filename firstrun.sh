#!/bin/bash

configCreate (){
	mkdir -p ~/.config/nvim
	echo "set clipboard=unnamedplus" > ~/.config/nvim/init.vim
}

# As of 2023-09-14
echo "Installing nix..."
sh <(curl -L https://nixos.org/nix/install)
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## This is incredibly hacky, but I haven't figured out home-manager yet and was struggling figuring out the basics
## Just making sure my config files stick around
configCreate
