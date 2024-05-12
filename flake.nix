{
  description = "";

  inputs = { nix-colors.url = "github:misterio77/nix-colors"; };

  outputs = { self, nix-colors }:
    {
      homeManagerModules.default = import ./adapters;
    };
}
