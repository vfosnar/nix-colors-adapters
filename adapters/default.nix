{ config, lib, ... }:

let
  mkDisableOption = name: lib.mkOption {
    default = true;
    type = lib.types.bool;
    example = false;
    description = "Whether to enable ${name}";
  };
in
{
  options.nixColorsAdapters.accent = lib.mkOption {
    default = config.colorScheme.colors.base0D;
    type = lib.types.string;
    example = "base08";
    description = "What color to use as an accent color";
  };
  imports = [
    ./adwaita.nix
    { inherit mkDisableOption; }
    ./firefox.nix
    { inherit mkDisableOption; }
    ./rofi.nix
    { inherit mkDisableOption; }
    ./swaylock.nix
    { inherit mkDisableOption; }
  ];
}
