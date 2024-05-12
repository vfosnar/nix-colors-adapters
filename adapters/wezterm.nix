{ config, inputs, lib, ... }:

let
  pathToScheme = "${config.xdg.configHome}/wezterm/nix-colors-adapters-base16.yaml";
in
{
  options.nixColorsAdapters.wezterm = {
    enable = lib.mkEnableOption "wezterm" // { default = true; };
    base16-file = lib.mkOption {
      type = lib.types.path;
    };
  };

  config = lib.mkIf config.nixColorsAdapters.wezterm.enable {
    nixColorsAdapters.wezterm.base16-file = pathToScheme;
    home.file.${pathToScheme} = {
      text = inputs.nix-colors.lib.schemeToYAML config.colorScheme;
    };
  };
}
