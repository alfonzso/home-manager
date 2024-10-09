{ lib, pkgs, ... }:
{
  xdg.configHome = "/home/ealfzso/.config-ubuntu-20.04";

  home = {

    packages = with pkgs; [
      ripgrep-all
      fzf
      tldr
      fluxcd
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
      myNeo
      vscode
      x11vnc
      jq
      bash-completion
    ];

    username = "ealfzso";
    homeDirectory = "/home/ealfzso";

      stateVersion = "23.11";
    };

    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      userName = "Zsolt Alfoldi";
      userEmail = "zsolt.alfoldi@ericsson.com";

      ignores = [
        ".tmp"
        "tmp"
      ];

      extraConfig = {
        core = {
          editor = "nvim";
          whitespace = "trailing-space,space-before-tab";
          quotepath = "off";
        };
        stash = {
          showPatch = "1";
        };
        color = {
          pager = "true";
          diff = "true";
          grep = "true";
          interactive = "true";
          status = "always";
          ui = "true";
        };
        "merge \"po\"" = {
          name = "Gettext merge driver";
          driver = "git-merge-po.sh %O %A %B";
        };
        apply = {
          whitespace = "fix";
        };
        diff = {
          tool = "nvim -d";
          colorMoved = "default";
        };
        "color \"diff-highlight\"" = {
          oldNormal = "red bold";
          oldHighlight = "red bold 52";
          newNormal = "green bold";
          newHighlight = "green bold 22";
        };
        "color \"diff\"" = {
          meta = "yellow";
          frag = "magenta bold";
          commit = "yellow bold";
          old = "red bold";
          new = "green bold";
          whitespace = "red reverse";
        };
        merge = {
          tool = "nvim";
        };
        "mergetool \"meld\"" = {
          cmd = "meld \"$LOCAL\" \"$MERGED\" \"$REMOTE\" --output \"$MERGED\"";
        };
        "mergetool \"nvim\"" = {
          cmd = "nvim -d \"$LOCAL\" \"$REMOTE\" \"$MERGED\" -c '$wincmd w' -c 'wincmd J'";
        };
        "mergetool \"vscode\"" = {
          cmd = "code --wait \"$MERGED\"";
        };
      };

    };
}




