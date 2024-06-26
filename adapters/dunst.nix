{ config, lib, ... }:

{
  options.nixColorsAdapters.dunst = {
    enable = lib.mkEnableOption "dunst" // { default = true; };
  };

  config = lib.mkIf config.nixColorsAdapters.dunst.enable {
    # https://github.com/tinted-theming/base16-dunst/blob/0379826aad4fbb6f39305920be232195d3cc80f4/templates/default.mustache
    services.dunst.settings = with config.colorScheme.colors; {
      global = {
        frame_color = "#${base05}";
        separator_color = "#${base05}";
      };
      urgency_low = {
        background = "#${base01}";
        foreground = "#${base03}";
      };
      urgency_normal = {
        background = "#${base02}";
        foreground = "#${base05}";
      };
      urgency_critical = {
        background = "#${base08}";
        foreground = "#${base06}";
      };
    };
  };
}
