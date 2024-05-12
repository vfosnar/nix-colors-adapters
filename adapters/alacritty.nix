{ config, inputs, lib, ... }:

{
  options.nixColorsAdapters.alacritty = {
    enable = lib.mkEnableOption "alacritty" // { default = true; };
  };

  config = lib.mkIf config.nixColorsAdapters.alacritty.enable {
    programs.settings.theme = with config.colorScheme.colors; ''
      # Default colors
      [colors.primary]
      background = '0x${base00}'
      foreground = '0x${base05}'

      # Colors the cursor will use if `custom_cursor_colors` is true
      [colors.cursor]
      text = '0x${base00}'
      cursor = '0x${base05}'

      # Normal colors
      [colors.normal]
      black = '0x${base00}'
      red = '0x${base08}'
      green = '0x${base0B}'
      yellow = '0x${base0A}'
      blue = '0x${base0D}'
      magenta = '0x${base0E}'
      cyan = '0x${base0C}'
      white = '0x${base05}'

      # Bright colors
      [colors.bright]
      black = '0x${base03}'
      red = '0x${base08}'
      green = '0x${base0B}'
      yellow = '0x${base0A}'
      blue = '0x${base0D}'
      magenta = '0x${base0E}'
      cyan = '0x${base0C}'
      white = '0x${base07}'

      [[colors.indexed_colors]]
      index = 16
      color = "0x${base09}"

      [[colors.indexed_colors]]
      index = 17
      color = "0x${base0F}"

      [[colors.indexed_colors]]
      index = 18
      color = "0x${base01}"

      [[colors.indexed_colors]]
      index = 19
      color = "0x${base02}"

      [[colors.indexed_colors]]
      index = 20
      color = "0x${base04}"

      [[colors.indexed_colors]]
      index = 21
      color = "0x${base06}"
    '';
  };
}
