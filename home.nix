{ config, lib, pkgs, ... }:

let
  # Download the file using fetchurl
  downloadedFile = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh";
    # url = "https://example.com/file.zip";  # Replace with the actual file URL
    # sha256 = "0lnksddq2mfcsjyp8y57vmyr8jjcnkz9mk5zjl5g5znkmj18j40p";  # Replace with the actual SHA256 hash
    sha256 = "7ff718f4a06fd0a0be7edfef926abb41b1353c48c1515ad312d226965b74943a";
  };
in
{
  # home-manager.backupFileExtension = ".bak";
  home = {

    file = {
      # This will place the file in your home directory, e.g., ~/.config/myfile.zip
      # ".config/myfile.zip".source = downloadedFile;

      # You can specify another path, e.g., ~/.local/share, if needed
      # ".nix-profile/share/git/contrib/completion/git-prompt.sh".source = downloadedFile;

      ".local/share/git/contrib/completion/git-prompt.sh".source = downloadedFile;
      # ".local/share/file.zip".source = downloadedFile;
    };

    # backupFileExtension = "backup";

    packages = with pkgs; [
      kind
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

  programs = {
    git = {
      enable = true;
      userName = "EALFZSO";
      userEmail = "zsolt.alfoldi@ericsson.com";
      # includes = [
      #   { path = "~/.gitconfig.local"; }
      # ];
    };
    home-manager.enable = true;
    zsh = {
      enable = true;

      ## initExtra = ''
      ##   setopt PROMPT_SUBST
      ##   PROMPT="%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ "
      ## '';

      initExtra =
      ''
        source ~/.local/share/git/contrib/completion/git-prompt.sh
        setopt PROMPT_SUBST
        export PS1='%~ $(__git_ps1 "(%s) ")%# '
      '';

      oh-my-zsh = {
        enable = true;
        theme = "avit";  # Set the desired theme here
        plugins = [ "git" "sudo" "z"];
      };
    };
  };

}
