{
  getAccentForTheme = colorScheme:
    let
      dictionary = with colorScheme.colors; {
        "ayu-light" = base09;
        "ayu-dark" = base0A;
        "gruvbox-dark-hard" = base0C;
        "gruvbox-dark-medium" = base0C;
        "gruvbox-dark-pale" = base0C;
        "gruvbox-dark-soft" = base0C;
        "gruvbox-light-hard" = base0E;
        "gruvbox-light-medium" = base0E;
        "gruvbox-light-soft" = base0E;
      };
    in
    if builtins.hasAttr colorScheme.slug dictionary
    then (builtins.getAttr colorScheme.slug dictionary)
    else colorScheme.colors.base0D;
}
