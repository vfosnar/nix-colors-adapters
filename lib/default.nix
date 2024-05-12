{
  getAccentForTheme = colorScheme:
    let
      dictionary = with colorScheme.colors; {
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
    if builtins.hasAttr colorScheme.slug dictionary
    then (builtins.getAttr colorScheme.slug dictionary)
    else colorScheme.colors.base0D;
}
