{ config, lib, ... }:

{
  options.nixColorsAdapters.firefox = {
    enable = lib.mkEnableOption "firefox" // { default = true; };
    profiles = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      example = [ "johndoe" ];
      description = ''
        Firefox profiles
      '';
    };
  };

  config = lib.mkIf config.nixColorsAdapters.firefox.enable {
    assertions = [
      {
        assertion = config.nixColorsAdapters.adwaita.enable;
        message = "Firefox requires Adwaita to be enabled. Please enable Adwaita.";
      }
      {
        assertion = config.gtk.enable;
        message = "Firefox requires GTK theming to be enabled. Please enable GTK theming with `gtk.enable = true;`.";
      }
    ];

    programs.firefox.profiles = builtins.listToAttrs (lib.lists.forEach config.nixColorsAdapters.firefox.profiles (profile: {
      name = profile;
      value = {
        settings = {
          "ui.systemUsesDarkTheme" = config.colorScheme.variant == "dark";
          "browser.theme.toolbar-theme" = if config.colorScheme.variant == "dark" then 0 else 1;
          "browser.theme.content-theme" = if config.colorScheme.variant == "dark" then 0 else 1;
          "layout.css.prefers-color-scheme.content-override" = if config.colorScheme.variant == "dark" then 0 else 1;
        };

        # https://searchfox.org/mozilla-central/rev/66ce9f5cbc6578f4fb7b5e0181b6c234ad40d558/toolkit/modules/LightweightThemeConsumer.sys.mjs
        userChrome = with config.colorScheme.colors;
          let
            # Firefox uses accent for tab bar background, actual accent color is inherited from GTK3
            accentcolor = base00;
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
            toolbar_field_highlight = config.nixColorsAdapters.accent; # TODO https://searchfox.org/mozilla-central/rev/66ce9f5cbc6578f4fb7b5e0181b6c234ad40d558/toolkit/modules/LightweightThemeConsumer.sys.mjs#149
            toolbar_field_highlight_text = base04;
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
              /*--lwt-toolbar-field-highlight: #${toolbar_field_highlight} !important;
              --lwt-toolbar-field-highlight-text: #${toolbar_field_highlight_text} !important;*/
            }
          '';

        userContent = with config.colorScheme.colors; ''
          @-moz-document url("about:newtab") {
            :root {
              --newtab-text-primary-color: #${base04} !important;
              --newtab-background-color: #${base00} !important;
              --newtab-background-color-secondary: #${base02} !important;
            }
          }

          @-moz-document url-prefix(about:) {
            :root {
              /* global */
              --in-content-accent-color: #${config.nixColorsAdapters.accent} !important;
              --color-accent-primary-hover: color-mix(in srgb, #${config.nixColorsAdapters.accent}, #777777 50%) !important;

              /* body */
              --in-content-page-color: #${base04} !important;
              --in-content-page-background: #${base00} !important;

              /* button */
              --in-content-button-background: #${base02} !important;
              --in-content-button-background-hover: color-mix(in srgb, #${base02}, #777777 20%) !important;
            
              --in-content-primary-button-text-color: #${base00} !important;
              --in-content-primary-button-background: #${config.nixColorsAdapters.accent} !important;
              --in-content-primary-button-background-hover: color-mix(in srgb, #${config.nixColorsAdapters.accent}, #777777 50%) !important;
              --in-content-primary-button-background-active: color-mix(in srgb, #${config.nixColorsAdapters.accent}, #777777 50%) !important;
              --in-content-primary-button-border-hover: transparent;

              /* links */
              --link-color: #${config.nixColorsAdapters.accent} !important;

              /* inputs */
              --focus-outline-color: #${config.nixColorsAdapters.accent} !important;
            
              /* box */
              --box-background-color: #${base01} !important;
              --in-content-box-info-background: #${base02} !important;
            }
          }
        '';
      };
    }));
  };
}
