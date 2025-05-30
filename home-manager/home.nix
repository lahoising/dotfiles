{ config, pkgs, ... }:

{
  home.username = "lahoising";
  home.homeDirectory = "/home/lahoising";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.openssh
    pkgs.ripgrep
    pkgs.zig
    pkgs.pavucontrol
    pkgs.brightnessctl
    pkgs.cargo
    pkgs.wget
    pkgs.cmake
    pkgs.gnat
    pkgs.jdk
    pkgs.lua
    pkgs.luajitPackages.luarocks
    pkgs.readline
    pkgs.rustc

    pkgs.oh-my-zsh
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;

  programs.wofi = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userEmail = "lahoising78@gmail.com";
    userName = "Luis";
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
  };
}
