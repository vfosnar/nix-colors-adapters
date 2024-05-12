{
  description = "";

  inputs = { nix-colors.url = "github:misterio77/nix-colors"; };

  outputs = { self, nix-colors }:
    let nixColorsAdaptersLib = import ./lib; in {
      _module.args.mkDisableOption = nixColorsAdaptersLib;
      homeManagerModules.default = import ./adapters;
      lib = nixColorsAdaptersLib;
    };
}
