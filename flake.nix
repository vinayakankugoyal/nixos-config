{
  description = "NixOS configuration with Noctalia";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, noctalia, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit noctalia; };
      modules = [
        ./configuration.nix
        ({ pkgs, ... }: {
          environment.systemPackages = with pkgs; [
            noctalia.packages.x86_64-linux.default
          ];
        })
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.murd3rbot = import ./home.nix;
        }
      ];
    };
  };
}
