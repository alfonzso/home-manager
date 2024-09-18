# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ./dnsmasq.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  wsl.wslConf.network.generateResolvConf = false;

  networking = {
    # nameservers = [ "193.181.14.11" "193.181.14.10" "8.8.8.8" "1.1.1.1" ];
    nameservers = [ "127.0.0.1" ];
    search = [ "ericsson.se" ];
    # extraOptions = ''
    #   options timeout:2 attempts:3 rotate
    # '';
    # resolvconf.extraOptions = [ "timeout:1" "attempts:1" "rotate" ];
  };

  services.customDnsmasq = {
    enable = true;
    companyDnsServer = "193.181.14.11";
    companyDomain = "ericsson.se";
    homeDnsServer = "192.168.1.1";
    homeDomain = "lan";
    publicDnsServers = [ "8.8.8.8" "8.8.4.4" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
}
