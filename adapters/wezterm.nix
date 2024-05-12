{ config, inputs, lib, ... }:

let
  pathToScheme = "${config.xdg.configHome}/wezterm/nix-colors-adapters-base16.yaml";
in
{
  options.nixColorsAdapters.wezterm = {
    enable = lib.mkEnableOption "wezterm" // { default = true; };
  };

  config = lib.mkIf config.nixColorsAdapters.wezterm.enable {
    nixColorsAdapters.wezterm.base16-file = pathToScheme;
    file.${pathToScheme} = {
      text = inputs.nix-colors.lib.schemeToYAML config.colorScheme;
    };
  };
}
