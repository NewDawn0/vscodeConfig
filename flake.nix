{
  description = "Runnable VSCode config";

  inputs.utils.url = "github:NewDawn0/nixUtils";

  outputs = { self, utils, ... }: {
    overlays.default = final: prev: {
      ndvscode = self.packages.${prev.system}.default;
      ndvscode-config = self.packages.${prev.system}.ndvscode-config;
    };
    packages = utils.lib.eachSystem {
      config = { allowUnfree = true; };
      overlays = [
        (final: prev: {
          vscode-extensions = prev.vscode-extensions
            // (import ./overlays.nix { pkgs = prev; });
        })
      ];
    } (pkgs:
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
