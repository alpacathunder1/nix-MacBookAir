#!/bin/bash
# Untested. Might be moving from nix to ansible for a clean setup.  Just placing this here to document it.

emacsInstall () {
	brew tap railwaycat/emacsmacport
	brew install emacs-mac --with-modules
	ln -s /opt/homebrew/opt/emacs-mac/Emacs.app /Applications/Emacs.app
}
doomInstall () {
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
	~/.config/emacs/bin/doom install
}

emacsInstall
doomInstall
