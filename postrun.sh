#!/bin/sh
# I couldn't get the shell to be modified within nix for now, so I'm just "documenting" this as a dumb script
# https://gist.github.com/idleberg/9c7aaa3abedc58694df5
sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s "$(which fish)"
