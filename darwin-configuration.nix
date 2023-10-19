{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.neovim
    pkgs.ranger
    pkgs.neofetch
    pkgs.git
    pkgs.ripgrep
    pkgs.tmux
    pkgs.sshuttle
    pkgs.python3
    pkgs.htop
    pkgs.pandoc
    pkgs.pipx
    pkgs.nixfmt
    pkgs.colordiff
    pkgs.fzf
    pkgs.openssl
    pkgs.coreutils
    pkgs.wget
  ];

  networking.hostName = "MacBookAir";

  environment.variables = {
    EDITOR = "nvim";
    GIT_AUTHOR_EMAIL = "ataylor@posteo.us";
    GIT_AUTHOR_NAME = "Alex Taylor";
    PATH = "/opt/homebrew/bin:$PATH";
    HOMEBREW_NO_ANALYTICS = "1";
    PROMPT = "%n %~ $ ";
  };

  homebrew.enable = true;
  homebrew.taps = [ "parera10/csshx" ];
  homebrew.casks = [
    "firefox"
    "thunderbird"
    "obsidian"
    "iterm2"
    "moonlight"
    "nextcloud"
    "microsoft-powerpoint"
    "microsoft-word"
    "signal"
    "spotify"
    "anki"
    "balenaetcher"
    "xquartz"
    "iina"
    "rectangle"
    "orangedrangon-android-messages"
    "caffeine"
  ];
  homebrew.brews = [ "parera10/csshx/csshx" ];
  homebrew.masApps = { "Wireguard" = 1451685025; };
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

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # This gives me trouble with ctrl+r, so I'm commenting it out for now
  programs.zsh.promptInit = ''
    PROMPT="%n %~ $ " && bindkey '^R' history-incremental-search-backward && test -f /tmp/unlock || ssh-add --apple-use-keychain ~/.ssh/id_rsa && touch /tmp/unlock'';
  # programs.fish.enable = true;
  ## Nix Aliases
  environment.shellAliases.nixUp =
    "nix-channel --update;darwin-rebuild switch;brew update;brew upgrade";
  ## neovim aliases
  environment.shellAliases.vi = "nvim";
  environment.shellAliases.vim = "nvim";
  environment.shellAliases.view = ''nvim -R "$@"'';
  ## git aliases
  environment.shellAliases.gca = "git commit -av";
  environment.shellAliases.gp = "git pull -v;git push -v";
  environment.shellAliases.gs = "git status";
  ## colordiff
  environment.shellAliases.diff = ''colordiff --nobanner "$@"'';
  ## ls color
  environment.shellAliases.ls = "ls --color=always";
  ## iina -> mpv
  environment.shellAliases.mpv = "iina";
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
