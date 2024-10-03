# flake.nix
# Don't copy and paste this.  Read above first if you tried to cheat and skim.
{
  description = "My Home Manager configuration";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };

    neovimpkgs = { url = "github:nixos/nixpkgs/nixos-24.05"; };

    home-manager = {
      # url = "github:nix-community/home-manager/release-23.11";
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, neovimpkgs, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
      };

      neopkgs = import neovimpkgs { system = "x86_64-linux"; };
      # myNeo = neopkgs.neovim;

      combinedPkgs = pkgs.extend (final: prev: {
        # myCustomNeovim = customPkgsSet.neovim;
        # myNeo = neopkgs.neovim;
        myNeo = pkgs.neovim;
      });

    in {
      # pkgs.x86_64-linux.myNeovim = myNeo;
      homeConfigurations = {
        zsolt = home-manager.lib.homeManagerConfiguration {
          # inherit combinedPkgs;
          pkgs = combinedPkgs;
          modules = [ ./home.nix ];

        };
      };
    };
}

