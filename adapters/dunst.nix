{ config, inputs, lib, ... }:

{
  options.nixColorsAdapters.dunst = {
    enable = lib.mkEnableOption "dunst" // { default = true; };
  };

  config = lib.mkIf config.nixColorsAdapters.dunst.enable {
    programs.dunst.settings = with config.colorScheme.colors; ''
      [global]
      frame_color = "#${base05}"
      separator_color = "#${base05}"

      [base16_low]
          msg_urgency = "low"
          background = "#${base01}"
          foreground = "#${base03}"

      [base16_normal]
          msg_urgency = "normal"
          background = "#${base02}"
          foreground = "#${base05}"

      [base16_critical]
          msg_urgency = "critical"
          background = "#${base08}"
          foreground = "#${base06}"
    '';
  };
}