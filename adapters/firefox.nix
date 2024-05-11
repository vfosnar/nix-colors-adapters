{ config, lib, ... }:

{
  options.nixColorsAdapters.firefox = {
    profile = lib.mkOption {
      type = lib.types.str;
      example = "johndoe";
      description = ''
        Firefox profile name
      '';
    };
  };

  config.programs.firefox.profiles.${config.nixColorsAdapters.firefox.profile} =
    {
      settings = {
        "ui.systemUsesDarkTheme" = config.colorScheme.variant;
        "layout.css.prefers-color-scheme.content-override" =
          if config.colorScheme.variant == "dark" then 0 else 1;
      };

      userChrome = with config.colorScheme.colors; ''
        :root {
          color-scheme: ${config.colorScheme.variant};
          --toolbar-color-scheme: ${config.colorScheme.variant};

          --urlbarView-highlight-color: #${base04} !important;
          --urlbarView-highlight-background: #${base03} !important;

          --urlbarView-separator-color: #${base02} !important;
          --urlbarView-hover-background: #${base02} !important;
          --chrome-content-separator-color: transparent !important;
          --link-color: #${base0D} !important;

          --button-primary-color: #${base00} !important;
          --button-primary-bgcolor: #${base08} !important;
          --button-primary-hover-bgcolor: #${base09} !important;
          --button-primary-focus-bgcolor: #${base09} !important;

          --urlbar-box-hover-text-color: #${base04} !important;
          --urlbar-box-hover-bgcolor: #${base02} !important;
          
          /* Save password popup */
          --input-color: #${base04} !important;
          --input-bgcolor: #${base01} !important;

          /* https://github.com/MrOtherGuy/firefox-csshacks/blob/master/chrome/color_variable_template.css with additional patches */
          /* Popup panels */
          --arrowpanel-background: #${base00} !important;
          --arrowpanel-border-color: transparent !important;
          --arrowpanel-color: #${base04} !important;
          --arrowpanel-dimmed: #${base01} !important;
          /* window and toolbar background */
          --lwt-accent-color: #${base00} !important;
          --lwt-accent-color-inactive: #${base00} !important;
          --toolbar-color: #${base04} !important;
          --toolbar-bgcolor: #${base01} !important;
          /* tabs with system theme */
          --tab-selected-textcolor: #${base04} !important;
          --tab-selected-bgcolor: #${base01} !important;
          /* tabs with any other theme */
          --lwt-text-color: #${base04} !important;
          --lwt-selected-tab-background-color: #${base01} !important;
          /* toolbar area */
          --toolbarbutton-icon-fill: #${base04} !important;
          --toolbarbutton-hover-background: #${base02} !important;
          --lwt-toolbarbutton-hover-background: #${base02} !important;
          --toolbarbutton-active-background: #${base02} !important;
          --lwt-toolbarbutton-active-background: #${base02} !important;
          /* urlbar */
          --toolbar-field-border-color: transparent !important;
          --toolbar-field-focus-border-color: #${base09} !important;
          --urlbar-popup-url-color: #${base08} !important;
          /* urlbar Firefox < 92 */
          --lwt-toolbar-field-background-color: #${base00} !important;
          --lwt-toolbar-field-focus: #${base02} !important;
          --lwt-toolbar-field-color: #${base04} !important;
          --lwt-toolbar-field-focus-color: #${base04} !important;
          /* urlbar Firefox 92+ */
          --toolbar-field-background-color: #${base00} !important;
          --toolbar-field-focus-background-color: #${base02} !important;
          --toolbar-field-color: #${base04} !important;
          --toolbar-field-focus-color: #${base04} !important;
          /* sidebar - note the sidebar-box rule for the header-area */
          --lwt-sidebar-background-color: #${base00} !important;
          --lwt-sidebar-text-color: #${base04} !important;
        }
        /* line between nav-bar and tabs toolbar,
            also fallback color for border around selected tab */
        #navigator-toolbox{ --lwt-tabs-border-color: #${base08} !important; }
        /* Line above tabs */
        #tabbrowser-tabs{ --lwt-tab-line-color: #${base08} !important; }
        /* the header-area of sidebar needs this to work */
        #sidebar-box{ --sidebar-background-color: #${base00} !important; }
      '';
    };
}
