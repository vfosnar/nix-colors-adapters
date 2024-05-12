{ config, lib, ... }:

let nixColorsAdaptersLib = import ../lib; in
{
  options.nixColorsAdapters.accent = lib.mkOption {
    default = nixColorsAdaptersLib.getAccentForTheme config.colorScheme;
    type = lib.types.string;
    example = "base08";
    description = "What color to use as an accent color";
  };

  imports = [
    ./adwaita.nix
    ./alacritty.nix
    ./dunst.nix
    ./firefox.nix
    ./gtk2.nix
    ./rofi.nix
    ./swaylock.nix
    ./wezterm.nix
  ];
}
