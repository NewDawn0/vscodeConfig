{ pkgs }:
let newExt = pkgs.vscode-utils.buildVscodeMarketplaceExtension;
in {
  mangeshrex.Everblush = newExt {
    mktplcRef = {
      name = "Everblush";
      publisher = "mangeshrex";
      version = "0.1.1";
      hash = "sha256-hqRf3BGQMwFEpOMzpELMKmjS1eg4yPqgTiHQEwi7RUw";
    };
    meta = {
      changelog =
        "https://marketplace.visualstudio.com/items/mangeshrex.Everblush/changelog";
      description = "A dark, vibrant and beautiful looking colorscheme.";
      downloadPage =
        "https://marketplace.visualstudio.com/items?itemName=mangeshrex.Everblush";
      homepage = "https://github.com/Everblush/vscode#readme";
      license = pkgs.lib.licenses.mit;
    };
  };
}
