{
  description = "NixOS configuration with Noctalia";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
  };

  outputs = { self, nixpkgs, noctalia, ... }: {
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
      ];
    };
  };
}
