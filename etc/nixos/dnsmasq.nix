{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.customDnsmasq;
in
{
  options.services.customDnsmasq = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable custom dnsmasq service";
    };

    extraConfig = mkOption {
      type = types.str;
      default = "";
      description = "Extra dnsmasq configuration to append to the default config.";
    };

    companyDnsServer = mkOption {
      type = types.str;
      default = "";
      description = "Company DNS server to route specific domains.";
    };

    companyDomain = mkOption {
      type = types.str;
      default = "company.com";
      description = "Company domain name to route via company DNS server.";
    };

    homeDnsServer = mkOption {
      type = types.str;
      default = "192.168.1.1";
      description = "Home DNS server for local queries.";
    };

    homeDomain = mkOption {
      type = types.str;
      default = "home.local";
      description = "Local home domain for your network.";
    };

    publicDnsServers = mkOption {
      type = types.listOf types.str;
      default = [ "8.8.8.8" "8.8.4.4" ];
      description = "Public DNS servers for general internet queries.";
    };
  };

  config = mkIf cfg.enable {
    services.dnsmasq = {
      enable = true;
      extraConfig = ''
        server=/${cfg.companyDomain}/${cfg.companyDnsServer}
        server=/${cfg.homeDomain}/${cfg.homeDnsServer}
        ${concatMapStrings (dnsServer: "server=${dnsServer}\n") cfg.publicDnsServers}

        local=/${cfg.homeDomain}/
        domain=${cfg.homeDomain}
        expand-hosts

        ${cfg.extraConfig}
      '';
    };

    networking = {
      nameservers = [ "127.0.0.1" ];
    };
  };
}

