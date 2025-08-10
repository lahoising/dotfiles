{ config, pkgs, ... }:

let
  isMacOs = pkgs.system == "aarch64-darwin";
in
{
  home.username = "lahoising";
  home.homeDirectory = (if isMacOs
    then "/Users/"
    else "/home/"
  ) + "lahoising";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.ripgrep
    pkgs.jdk
    pkgs.luajitPackages.luarocks
    pkgs.readline
    pkgs.rustc

    # programming languages
    pkgs.cargo # rust
    pkgs.kotlin
    pkgs.lua
    pkgs.nodePackages.nodejs
    pkgs.zig
  ] ++ (if isMacOs
  then []
  else [
    pkgs.openssh
    pkgs.wget
    pkgs.cmake
    pkgs.gnat

    pkgs.pavucontrol
    pkgs.brightnessctl
  ]);

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
    EDITOR = "nvim";
  };

  nixGL = if isMacOs 
  then {}
  else {
    packages = import <nixgl> { inherit pkgs; };
  };

  programs.home-manager.enable = true;

  programs.wofi = {
    enable = !isMacOs;
  };

  programs.tmux = {
    enable = true;
    focusEvents = true;
    keyMode = "vi";
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
      theme = "bira";
      plugins = [
        "git"
      ];
    };
  };

  programs.ghostty = if isMacOs 
  then {}
  else {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.ghostty;
  };
}
