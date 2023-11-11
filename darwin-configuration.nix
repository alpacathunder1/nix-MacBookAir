{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.colordiff
    pkgs.coreutils
    pkgs.fd
    pkgs.findutils
    pkgs.fzf
    pkgs.git
    pkgs.htop
    pkgs.mediainfo
    pkgs.neofetch
    pkgs.neovim
    pkgs.nixfmt
    pkgs.openssl
    pkgs.pandoc
    pkgs.pipx
    pkgs.python3
    pkgs.ranger
    pkgs.ripgrep
    pkgs.shellcheck
    pkgs.wget
  ];

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
  homebrew.taps = [ "parera10/csshx" ];
  homebrew.casks = [
    "appcleaner"
    "balenaetcher"
    "caffeine"
    "calibre"
    "discord"
    "firefox"
    "iina"
    "iterm2"
    "keka"
    "malwarebytes"
    "moonlight"
    "nextcloud"
    "obsidian"
    "orangedrangon-android-messages"
    "puppetlabs/puppet/pdk"
    "rectangle"
    "signal"
    "spotify"
    "thunderbird"
    "vscodium"
    "webex"
    "xquartz"
    "zotero"
  ];
  homebrew.brews =
    [ "parera10/csshx/csshx" "poppler" "simple-scan" "virt-manager" ];
  homebrew.masApps = {
    "Microsoft Excel" = 462058435;
    "Microsoft PowerPoint" = 462062816;
    "Microsoft Remote Desktop" = 1295203466;
    "Microsoft Word" = 462054704;
    "Pixelamator" = 1289583905;
    "Wireguard" = 1451685025;
  };
  ## Dark Mode
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
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
  environment.shellAliases.view = ''nvim -R $argv'';
  ## git aliases
  environment.shellAliases.gca = "git commit -av";
  environment.shellAliases.gp = "git pull -v;git push -v";
  environment.shellAliases.gs = "git status";
  ## colordiff
  environment.shellAliases.diff = ''colordiff --nobanner $argv'';
  ## ls color
  environment.shellAliases.ls = "ls --color=always";
  ## iina -> mpv
  environment.shellAliases.mpv = "iina";
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
