{
  description = "Base Flake";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";
    home-manager-stable.url = "github:nix-community/home-manager/release-23.11";
  };

  outputs = inputs@{ self, ... }:
    let
      globalSettings = {
        arch = "aarch64-linux";
      };
      pkgs = import inputs.nixpkgs {
        system = globalSettings.arch;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };
      lib = inputs.nixpkgs-stable.lib;
      home-manager-stable.inputs.nixpkgs.follows = "nixpkgs";
      home-manager = (inputs.home-manager-stable);

    in {
      nixosConfigurations.klopsnix = lib.nixosSystem {
        system = globalSettings.arch;
        modules = [
          ./configuration.nix
        ];
      };

      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
