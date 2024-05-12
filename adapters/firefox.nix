{ config, lib, mkDisableOption, ... }:

{
  options.nixColorsAdapters.firefox = {
    enable = mkDisableOption "firefox";
    profile = lib.mkOption {
      type = lib.types.str;
      example = "johndoe";
      description = ''
        Firefox profile name
      '';
    };

    # assertions = [
    #   {
    #     assertion = if config.nixColorsAdapters.firefox.enable then config.nixColorsAdapters.adwaita.enable else true;
    #     message = "Firefox requires Adwaita to be enabled. Please enable Adwaita.";
    #   }
    # ];
  };

  config = lib.mkIf config.nixColorsAdapters.firefox.enable {
    programs.firefox.profiles.${config.nixColorsAdapters.firefox.profile} =
      {
        # https://searchfox.org/mozilla-central/rev/66ce9f5cbc6578f4fb7b5e0181b6c234ad40d558/toolkit/modules/LightweightThemeConsumer.sys.mjs
        settings = {
          "ui.systemUsesDarkTheme" = config.colorScheme.variant;
          "browser.theme.toolbar-theme" = if config.colorScheme.variant == "dark" then 0 else 1;
          "browser.theme.content-theme" = if config.colorScheme.variant == "dark" then 0 else 1;
          "layout.css.prefers-color-scheme.content-override" = if config.colorScheme.variant == "dark" then 0 else 1;
        };

        userChrome = with config.colorScheme.colors;
          let
            accentcolor = config.nixColorsAdapters.accent;
            textcolor = base04;
            popup = base01;
            popup_text = base04;
            # popup_border = ;
            toolbar_field = base02;
            toolbarColor = base01;
            toolbar_text = base04;
            toolbar_field_text = base04;
            # toolbar_field_border = ;
            toolbar_field_focus = base02; # TODO https://searchfox.org/mozilla-central/rev/66ce9f5cbc6578f4fb7b5e0181b6c234ad40d558/toolkit/modules/LightweightThemeConsumer.sys.mjs#113
            toolbar_field_text_focus = base04;
            # toolbar_field_border_focus = ;
            toolbar_field_highlight = "ff0000"; # TODO https://searchfox.org/mozilla-central/rev/66ce9f5cbc6578f4fb7b5e0181b6c234ad40d558/toolkit/modules/LightweightThemeConsumer.sys.mjs#149
            toolbar_field_highlight_text = "00ff00";
          in
          ''
            :root {
              color-scheme: ${config.colorScheme.variant} !important;
              --lwt-accent-color: #${accentcolor} !important;
              --lwt-text-color: #${textcolor} !important;
              --arrowpanel-background: #${popup} !important;
              --arrowpanel-color: #${popup_text} !important;
              --arrowpanel-border-color: transparent !important;
              --toolbar-field-background-color: #${toolbar_field} !important;
              --toolbar-bgcolor: #${toolbarColor} !important;
              --toolbar-color: #${toolbar_text} !important;
              --toolbar-field-color: #${toolbar_field_text} !important;
              --toolbar-field-border-color: transparent !important;
              --toolbar-field-focus-background-color: #${toolbar_field_focus} !important;
              --toolbar-field-focus-color: #${toolbar_field_text_focus} !important;
              --toolbar-field-focus-border-color: transparent !important;
              --lwt-toolbar-field-highlight: #${toolbar_field_highlight} !important;
              --lwt-toolbar-field-highlight-text: #${toolbar_field_highlight_text} !important;
            }
          '';
      };
  };
}
