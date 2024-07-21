{
  description = "Tabwrangler flake";

  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
    nixpkgs.follows = "dream2nix/nixpkgs";
  };

  outputs = {
    self,
    dream2nix,
    nixpkgs,
  }: let
    eachSystem = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  in {
    packages = eachSystem (system: {
      # For each system, we define our default package
      # by passing in our desired nixpkgs revision plus
      # any dream2nix modules needed by it.
      default = dream2nix.lib.evalModules {
        packageSets.nixpkgs = nixpkgs.legacyPackages.${system};
        modules = [
          # Import our actual package definition as a dream2nix module from ./default.nix
          ./default.nix
          {
            paths.projectRoot = ./.;
            paths.projectRootFile = "flake.nix";
            paths.package = ./.;
          }
        ];
      };
    });
  };
}