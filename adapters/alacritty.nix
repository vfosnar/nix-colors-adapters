{ config, lib, ... }:

{
  options.nixColorsAdapters.alacritty = {
    enable = lib.mkEnableOption "alacritty" // { default = true; };
  };

  config = lib.mkIf config.nixColorsAdapters.alacritty.enable {
    # https://github.com/aarowill/base16-alacritty/blob/c95c200b3af739708455a03b5d185d3d2d263c6e/templates/default-256.mustache
    programs.alacritty.settings = with config.colorScheme.colors; {
      colors = {
        primary = {
          background = "0x${base00}";
          foreground = "0x${base05}";
        };
        cursor = {
          text = "0x${base00}";
          cursor = "0x${base05}";
        };
        normal = {
          black = "0x${base00}";
          red = "0x${base08}";
          green = "0x${base0B}";
          yellow = "0x${base0A}";
          blue = "0x${base0D}";
          magenta = "0x${base0E}";
          cyan = "0x${base0C}";
          white = "0x${base05}";
        };
        bright = {
          black = "0x${base03}";
          red = "0x${base08}";
          green = "0x${base0B}";
          yellow = "0x${base0A}";
          blue = "0x${base0D}";
          magenta = "0x${base0E}";
          cyan = "0x${base0C}";
          white = "0x${base07}";
        };
        indexed_colors = [
          { index = 16; color = "0x${base09}"; }
          { index = 17; color = "0x${base0F}"; }
          { index = 18; color = "0x${base01}"; }
          { index = 19; color = "0x${base02}"; }
          { index = 20; color = "0x${base04}"; }
          { index = 21; color = "0x${base06}"; }
        ];
      };
    };
  };
}
