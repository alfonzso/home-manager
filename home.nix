{ lib, pkgs, ... }:

# let
#   # Define the Python package set
#   myPython = pkgs.python310.withPackages (ps: with ps; [
#     poetry
#     # Add other Python packages here
#   ]);
# in
{
  home = {
    packages = with pkgs; [
      # (python312.withPackages (p: with p; [
      #    pipx 
      # ]))
      kind
      socat
      poetry
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
      lynx
    ];

    # This needs to actually be set to your username
    username = "zsolt";
    homeDirectory = "/home/zsolt";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "alfonzso";
    userEmail = "alfonzso@gmail.com";
  };

  home.sessionVariables = {
    # POETRY_VIRTUALENVS_CREATE = "false";
    POETRY_VIRTUALENVS_IN_PROJECT = "true";
  };

}
