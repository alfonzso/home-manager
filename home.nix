{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      expect
      k9s
      kubectx
      operator-sdk
      kubebuilder
      kind
      vim
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
      jq
      bash-completion
    ];

    # This needs to actually be set to your username
    username = "ealfzso";
    homeDirectory = "/home/ealfzso";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

}
