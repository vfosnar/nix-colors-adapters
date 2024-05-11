{
  description = "";

  inputs = { };

  outputs = { self, ... }: { homeManagerModules.default = import ./adapters; };
}
