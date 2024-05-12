{ config, inputs, lib, ... }:

{
  options.nixColorsAdapters.gtk2 = {
    enable = lib.mkEnableOption "gtk2" // { default = true; };
  };

  config = lib.mkIf config.nixColorsAdapters.gtk2.enable {
    gtk.gtk2.extraConfig = with config.colorScheme.colors; ''
      gtk-color-scheme = "bg_color:#${base00}\nfg_color:#${base05}\nbase_color:#${base00}\ntext_color:#${base05}\nselected_bg_color:#${base02}\nselected_fg_color:#${base05}\ntooltip_bg_color:#${base00}\ntooltip_fg_color:#${base04}\ntitlebar_bg_color:#${base00}\ntitlebar_fg_color:#${base0D}\nmenubar_bg_color:#${base00}\nmenubar_fg_color:#${base0D}\ntoolbar_bg_color:#${base00}\ntoolbar_fg_color:#${base0A}\nmenu_bg_color:#${base00}\nmenu_fg_color:#${base05}\npanel_bg_color:#${base00}\npanel_fg_color:#${base0B}\nlink_color:#${base09}"
    '';
  };
}
