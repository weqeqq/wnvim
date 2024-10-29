{
  description = "Weqeq's neovim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }:
    let
      nixosPkgs = nixpkgs.legacyPackages.x86_64-linux;
      nixvimPkgs = nixvim.legacyPackages.x86_64-linux;
      wnvim = nixvimPkgs.makeNixvimWithModule {
        extraSpecialArgs.autoImport = import ./auto_import.nix;
        pkgs = nixosPkgs;
        module = {
          imports = [
            ./modules
            ./config
          ];
        };
      };
    in
    {
      homeManagerModules = rec {
        wnvim = import ./home_manager.nix self;
        default = wnvim;
      };
      packages.x86_64-linux = rec {
        inherit wnvim;
        default = wnvim;
      };
    };
}
