{ config, pkgs, lib, ... }:
{ home.packages =  with pkgs; [
  google-chrome
    slack
    direnv
    docker-compose
    awscli2
    dbeaver
    teams
    vial
    nodejs
    chromedriver
    nixpkgs-fmt
    neovim
    patchelf
    google-chrome-dev
    kate
    lens
    xorg.xrandr
    #libreoffice
    thunderbird
    postman
];



  home.stateVersion = "22.05";
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };


  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    history = {
      ignoreDups = true;
      save = 1000000;
      size = 1000000;
    };

    shellAliases = {
      c = "clear";
      clip = "xclip -sel c";
      g = "git";
      n = "nnn";
      ren = "qmv -f do";
      v = "nvim";
      x = "xplr";
      #ls = "exa";
      find = "fd";
      grc = "git reset $(git merge-base HEAD origin/main)";
    };

    initExtra = ''
      [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ] && source $HOME/.nix-profile/etc/profile.d/nix.sh
      export EDITOR=nvim
      export GOPATH=$HOME/go
      export PATH=$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin:$PATH
      export LANG=en_AU.UTF-8
      export LC_ALL=en_AU.UTF-8
      #export MANPAGER='nvim +Man!'
      export MANWIDTH=999
      export FZF_DEFAULT_COMMAND='fd'
      if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        export TERM="xterm-256color"
      fi
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "aws"
        "docker"
        "direnv"
        "encode64"
        "git"
        "git-extras"
        "kubectl"
        "man"
        "nmap"
        "sudo"
        "systemd"
        "tig"
        "yarn"
        "zsh-navigation-tools"
        "urltools"
      ];
    };
  };
}