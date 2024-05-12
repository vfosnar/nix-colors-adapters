{ config, lib, nixColorsAdaptersLib, ... }:

{
  options.nixColorsAdapters.accent = lib.mkOption {
    default = nixColorsAdaptersLib.getAccentForTheme config.colorScheme;
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
