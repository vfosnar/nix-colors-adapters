{ config, lib, ... }:

{
  options.nixColorsAdapters.accent = lib.mkOption {
    default = config.colorScheme.colors.base0D;
    type = lib.types.string;
    example = "base08";
    description = "What color to use as an accent color";
  };

  imports = [
    ./adwaita.nix
    ./firefox.nix
    ./rofi.nix
    ./swaylock.nix
  ];
}
