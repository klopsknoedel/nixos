{
  description = "Base Flake";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";
  };

  outputs = inputs@{ self, ... }:
    let
      globalSettings = {
        arch = "aarch64-linux";
      };
      lib = inputs.nixpkgs-stable.lib;

    in {
      nixosConfigurations.klopsnix = lib.nixosSystem {
        system = globalSettings.arch;
        modules = [
          ./configuration.nix
        ];
      };
    };
}
