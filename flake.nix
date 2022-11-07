{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };
  outputs = { self, nixpkgs, home-manager }: {

    nixosConfigurations =
          {
            nixos = nixpkgs.lib.nixosSystem rec {
              system = "x86_64-linux";
              modules =
                [
                  ./configuration.nix
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.armaan = import ./home.nix;

                    # Optionally, use home-manager.extraSpecialArgs to pass
                    # arguments to home.nix
                  }
                ];
            };

  };
};
}
