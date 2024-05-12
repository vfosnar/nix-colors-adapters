{
  description = "";

  inputs = { nix-colors.url = "github:misterio77/nix-colors"; };

  outputs = { self, nix-colors }:
    let nixColorsAdaptersLib = import ./lib; in {
      homeManagerModules.default = import ./adapters;
      lib = nixColorsAdaptersLib;
    };
}
