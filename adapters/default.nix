{ lib, ... }:

let
  mkDisableOption = name: lib.mkOption {
    default = true;
    type = lib.types.bool;
    example = false;
    description = "Whether to enable ${name}";
  };
in
{
  _module.args.mkDisableOption = mkDisableOption;
  imports = [
    ./adwaita.nix
    ./firefox.nix
    ./rofi.nix
    ./swaylock.nix
  ];
}
