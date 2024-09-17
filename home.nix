{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      busybox
      vim
      git
      iotop
      xrdp
      unixtools.nettools
      xclip
      tmux
      mc
      sublime4
      kubectl
      kubernetes-helm
      rsync
      go
      nodejs_22
      starship
      # neo
      myNeo
      vscode
      x11vnc
    ];

    # This needs to actually be set to your username
    username = "nixos";
    homeDirectory = "/home/nixos";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "23.11";
  };

  programs.git = {
    enable = true;
    userName = "EALFZSO";
    userEmail = "zsolt.alfoldi@ericsson.com";
    # includes = [
    #   { path = "~/.gitconfig.local"; }
    # ];
  };
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "avit";  # Set the desired theme here
      plugins = [ "git" "sudo" "z"];
    };
  };

}
