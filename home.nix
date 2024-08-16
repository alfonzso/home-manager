{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
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
    username = "zsolt";
    homeDirectory = "/home/zsolt";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

}
