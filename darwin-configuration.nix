{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  networking.hostName = "MacBookAir";

  environment.variables = {
    EDITOR = "nvim";
    GIT_AUTHOR_EMAIL = "ataylor@posteo.us";
    GIT_AUTHOR_NAME = "Alex Taylor";
    PATH = "/opt/homebrew/bin:/opt/homebrew/sbin:$PATH";
    HOMEBREW_NO_ANALYTICS = "1";
    PROMPT = "%n %~ $ ";
  };

  homebrew.enable = true;
  homebrew.taps = [ "parera10/csshx" "homebrew/cask-fonts" ];
  homebrew.casks = [
    "appcleaner"
    "balenaetcher"
    "homebrew/cask-fonts/font-bebas-neue"
    "homebrew/cask-fonts/font-ubuntu-mono"
    "firefox"
    "google-drive"
    "iina"
    "tabby"
    "keka"
    "obsidian"
    "notion"
    "parsec"
    "puppetlabs/puppet/pdk"
    "rectangle"
    "signal"
    "thunderbird"
    "ueli"
    "webex"
    "xquartz"
    "vscodium"
  ];
  homebrew.brews = [
    "ansible"
    "bitwarden-cli"
    "colordiff"
    "coreutils"
    "exiftool"
    "fd"
    "findutils"
    "fzf"
    "git"
    "htop"
    "imagemagick"
    "mediainfo"
    "neofetch"
    "neovim"
    "openssl"
    "pandoc"
    "parallel"
    "python3"
    "ranger"
    "ripgrep"
    "rsync"
    "openssh"
    "shellcheck"
    "sshuttle"
    "wget"
    "yt-dlp"
    "ansible-lint"
    "parera10/csshx/csshx"
    "poppler"
    "simple-scan"
    "virt-manager"
    "wireguard-tools"
  ];
  homebrew.masApps = {
    "LINE" = 539883307;
    "Microsoft Excel" = 462058435;
    "Microsoft PowerPoint" = 462062816;
    "Microsoft Remote Desktop" = 1295203466;
    "Pixelamator" = 1289583905;
  };
  ## Dark Mode
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = null;
  ## Autohide dock
  system.defaults.dock.autohide = true;
  ## Hot Corner
  system.defaults.dock.wvous-tl-corner = 2;
  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;
  # nix.package = pkgs.nix;

  programs.fish.enable = true;
  programs.zsh.enable = true; # default shell on catalina
  programs.zsh.promptInit =
    ''PROMPT="%n %~ $ " && bindkey '^R' history-incremental-search-backward'';
  programs.tmux.enable = true;
  programs.tmux.enableMouse = true;
  programs.tmux.extraConfig = ''
    set -g default-terminal "screen-256color";set-option -g status-right "\"#W\" %F "'';
  ## Nix Aliases
  environment.shellAliases.nixUp =
    "nix-channel --update;darwin-rebuild switch;brew update;brew upgrade";
  environment.shellAliases.obsidianUp = "brew reinstall obsidian";
  ## neovim aliases
  environment.shellAliases.vi = "nvim";
  environment.shellAliases.vim = "nvim";
  environment.shellAliases.view = "nvim -R $argv";
  ## git aliases
  environment.shellAliases.gca = "git commit -av";
  environment.shellAliases.gp = "git pull -v;git push -v";
  environment.shellAliases.gs = "git status";
  ## colordiff
  environment.shellAliases.diff = "colordiff --nobanner $argv";
  ## use gnu ls
  environment.shellAliases.ls = "gls --color=always";
  ## iina -> mpv
  environment.shellAliases.mpv = "iina";
  ## use brew's sftp
  environment.shellAliases.sftp = "/opt/homebrew/bin/sftp";
  ## use brew's rsync
  environment.shellAliases.rsync = "/opt/homebrew/bin/rsync";
  ## use brew's cut
  environment.shellAliases.cut = "/opt/homebrew/bin/gcut";
  ## environment fix for nix/brew & virt-manager & simple-scan
  environment.shellAliases.virt-manager =
    "OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES='' XDG_DATA_DIRS='' /opt/homebrew/bin/virt-manager --no-fork";
  environment.shellAliases.simple-scan =
    "XDG_DATA_DIRS='' /opt/homebrew/bin/simple-scan";
  # Used for backwards compatibility, please read the changelog before changing.
  ## wireguard up
  environment.shellAliases.wgup = "wg-quick up Home";
  environment.shellAliases.wgdown = "wg-quick down Home";
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
