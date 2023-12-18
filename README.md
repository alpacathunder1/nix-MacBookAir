# nix-MacBookAir

My M1 MacBook Air's nix config.

Currently, I haven't done much on the system after wiping outside of this config.

For completion, here are the things I've done that aren't in my nix conf:

+ Clicked through the setup
+ Connected to my Wi-Fi
+ Created my local user (alex)
+ Added my ssh keys
+ Removed a bunch of extra stuff from the dock
+ Rosetta
+ Enabled Japanese IME support
+ Logged into Bitwarden CLI (for ansible secrets)

I'm installing ".app's" through [brew casks](https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.casks).

From my [nixOS Desktop README](https://github.com/alpacathunder1/nixos-Desktop):

> I'm currently using [nixfmt](https://github.com/serokell/nixfmt) to format my code.  I tried integrating it into a git pre-commit hook, but git seemed to use the version *before* the script was ran for the commit.
> 
> Instead--I'm just going to try and call the included `nix-format.sh` script before committing, and find a more elegant solution later (famous last words, lol.)
