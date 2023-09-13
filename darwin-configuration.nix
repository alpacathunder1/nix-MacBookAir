{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.neovim
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
      #pkgs.bitwarden-cli
    ];

  networking.hostName = "MacBookAir";

  environment.variables = {
      EDITOR = "nvim";
  };

  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;
  ## Nix Aliases
  environment.shellAliases.drs = "darwin-rebuild switch";
  ## neovim aliases
  environment.shellAliases.vi = "nvim";
  environment.shellAliases.vim = "nvim";
  environment.shellAliases.view = "nvim -R \"$@\"";
  ## git aliases
  environment.shellAliases.gca = "git commit -av";
  environment.shellAliases.gp = "git pull -v;git push -v";
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
