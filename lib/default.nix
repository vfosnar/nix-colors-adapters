{ config, lib, ... }:

with config.colorScheme.colors;
let
  dictionary = {
    "ayu-light" = base0A;
    "ayu-dark" = base0A;
    "gruvbox-dark-hard" = base08;
    "gruvbox-dark-medium" = base08;
    "gruvbox-dark-pale" = base08;
    "gruvbox-dark-soft" = base08;
    "gruvbox-light-hard" = base08;
    "gruvbox-light-medium" = base08;
    "gruvbox-light-soft" = base08;
  };
in
{
  getAccentForTheme = slug: builtins.getAttr slug dictionary base0D;
}
