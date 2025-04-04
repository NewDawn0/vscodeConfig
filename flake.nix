{
  description = "Your awesome flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    utils = {
      url = "github:NewDawn0/nixUtils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, self, utils, ... }:
    let
      mkPkgs = { system, ... }:
        import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              vscode-extensions = prev.vscode-extensions
                // (import ./overlays.nix { pkgs = prev; });
            })
          ];
          config.allowUnfree = true;
        };
    in {
      overlays.default = final: prev: {
        ndvscode = self.packages.${prev.system}.default;
        ndvscode-config = self.packages.${prev.system}.ndvscode-config;
      };
      packages = utils.lib.eachSystem { inherit mkPkgs; } (pkgs:
        let
          ndvscode-config = import ./cfg/config.nix { inherit pkgs; };
          ndvscode = pkgs.vscode-with-extensions.override {
            vscodeExtensions = import ./cfg/plugins.nix { inherit pkgs; };
          };
        in {
          inherit ndvscode-config ndvscode;
          default = ndvscode;
        });
    };
}
