# nix-MacBookAir

My M1 MacBook Air's nix config.

Currently, I haven't done much on the system after wiping outside of this config.

For completion, here are the things I've done that aren't in my nix conf:

+ Clicked through the setup & ctre
+ Connected to my Wi-Fi
+ Created my local user (alex)
+ Installed the nix package manager
+ Added my ssh keys
+ Removed a bunch of extra stuff from the dock
+ Rosetta
+ Enabled Japanese IME support

I installed some GUI applications outside of nix since they don't seem to be maintained that well or at all, and I needed to get my laptop into a working state.  I'd like to put these in my nix conf somehow, even if it's just shell scripts that install them through brew.

I also need a way to manage updates.  Most of my "Apps" can check for updates in itself, but some (such as Moonlight) cannot.

### Installed Packages

+ `Obsidian-1.3.7-universal.dmg`
+ `Firefox 116.0.3.dmg`
+ `Nextcloud-3.9.3.pkg`
+ `Moonlight-4.3.1.dmg`
+ `Microsoft_Remote_Desktop_10.9.0_installer.pkg`
+ `Thunderbird 115.1.1.dmg`
+ `Webex.dmg`
+ `FedoraMediaWriter-osx-latest.dmg`
+ `Microsoft_Word_16.76.23082301_Installer.pkg`
+ `googlechrome.dmg`
+ `Docker.dmg`
+ `Microsoft_PowerPoint_16.76.23082301_Installer.pkg`

