{
  description = "";

  inputs = { nix-colors.url = "github:misterio77/nix-colors"; };

  outputs = { self }: { homeManagerModules.default = import ./adapters; };
}
