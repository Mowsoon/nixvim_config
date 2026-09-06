{
  description = "Advanced NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nixfmt
          statix
          deadnix
          git
        ];
      };

      formatter.${system} = pkgs.writeShellApplication {
        name = "format-and-lint";
        runtimeInputs = with pkgs; [
          nixfmt
          statix
          deadnix
          findutils
        ];
        text = ''
          echo "=> Nix formatting..."
          find . -name "*.nix" -exec nixfmt {} +

          echo "=> Nix linting..."
          statix check .

          echo "=> Nix dead code..."
          deadnix .
        '';
      };

      nixosConfigurations.vm-test = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          "${nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix"

          ./hosts/vm-test/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };
    };
}
