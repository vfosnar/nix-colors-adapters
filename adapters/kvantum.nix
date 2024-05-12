{ config, lib, pkgs, ... }:

{
  options.nixColorsAdapters.kvantum = {
    enable = lib.mkEnableOption "kvantum" // { default = true; };
  };

  config = lib.mkIf config.nixColorsAdapters.kvantum.enable {
    qt = {
      platformTheme = "kde";
      style.name = "kvantum";
    };

    home.packages = with pkgs; [
      breeze-icons # icons
      libsForQt5.kio-extras # file preview generator
    ];

    # https://github.com/catppuccin/Kvantum/tree/04be2ad3d28156cfb62478256f33b58ee27884e9/src/Catppuccin-Mocha-Lavender
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=HomeManager
      '';

      # Style `opacity:0.212` is added to fix itemview contrast.
      # There is still not enough contrast when clicking/holding
      # because it switches to `highlight.text.color` for the text color.
      # this property cannot be changed as other components depend on it.

      "Kvantum/HomeManager/HomeManager.kvconfig".text = with config.colorScheme.colors; ''
        [%General]
        author=elkrien based on Arc Dark style
        comment=HomeManager
        spread_menuitems=true
        left_tabs=true
        mirror_doc_tabs=true
        scroll_width=8
        attach_active_tab=true
        composite=true
        menu_shadow_depth=7
        tooltip_shadow_depth=0
        splitter_width=7
        check_size=16
        slider_width=4
        slider_handle_width=18
        slider_handle_length=18
        textless_progressbar=false
        menubar_mouse_tracking=true
        slim_toolbars=false
        toolbutton_style=1
        x11drag=menubar_and_primary_toolbar
        double_click=false
        translucent_windows=false
        blurring=false
        popup_blurring=true
        opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux3_qt4,avidemux3_qt5,kamoso,QtCreator,VirtualBox,trojita,dragon,digikam,qmplay2
        group_toolbar_buttons=false
        vertical_spin_indicators=false
        fill_rubberband=false
        spread_progressbar=true
        merge_menubar_with_toolbar=true
        small_icon_size=16
        large_icon_size=32
        button_icon_size=16
        scroll_arrows=false
        iconless_pushbutton=true
        toolbar_icon_size=16
        combo_as_lineedit=true
        button_contents_shift=false
        groupbox_top_label=true
        inline_spin_indicators=true
        joined_inactive_tabs=false
        layout_spacing=2
        submenu_overlap=0
        tooltip_delay=-1
        animate_states=false
        transient_scrollbar=true
        alt_mnemonic=true
        combo_menu=true
        layout_margin=4
        no_window_pattern=false
        respect_DE=true
        scroll_min_extent=36
        scrollable_menu=false
        scrollbar_in_view=false
        spin_button_width=16
        submenu_delay=250
        tree_branch_line=true
        progressbar_thickness=8
        click_behavior=0
        contrast=1.00
        dialog_button_layout=0
        drag_from_buttons=false
        hide_combo_checkboxes=false
        intensity=1.00
        no_inactiveness=false
        reduce_menu_opacity=0
        reduce_window_opacity=10
        saturation=1.00
        shadowless_popup=false
        transient_groove=false

        [GeneralColors]
        window.color=#${base00}
        base.color=#${base01}
        alt.base.color=#${base01}
        button.color=#${base02}
        light.color=#${base03}
        mid.light.color=#${base03}
        dark.color=#${base01}
        mid.color=#${base01}
        highlight.color=#${base07}
        inactive.highlight.color=#${base07}
        text.color=#${base05}
        window.text.color=#${base05}
        button.text.color=#${base05}
        disabled.text.color=#${base04}
        tooltip.text.color=#${base05}
        highlight.text.color=#${base01}
        link.color=#${base06}
        link.visited.color=#${base0D}

        [ItemView]
        inherits=PanelButtonCommand
        frame.element=itemview
        interior.element=itemview
        frame=true
        interior=true
        text.iconspacing=3
        text.toggle.color=#${base01} 

        [RadioButton]
        inherits=PanelButtonCommand
        frame=false
        interior.element=radio

        [CheckBox]
        inherits=PanelButtonCommand
        frame=false
        interior.element=checkbox

        [TreeExpander]
        indicator.element=tree
        indicator.size=8

        [ToolTip]
        frame.top=4
        frame.right=4
        frame.bottom=4
        frame.left=4
        frame=true

        [PanelButtonCommand]
        inherits=PanelButtonCommand
        interior.element=button
        frame.element=button
        text.normal.color=#${base05}
        text.focus.color=#${base05}
        text.press.color=#${base01}
        text.toggle.color=#${base01}

        [PanelButtonTool]
        inherits=PanelButtonCommand

        [DockTitle]
        inherits=PanelButtonCommand
        interior=false
        frame=false
        text.margin.top=5
        text.margin.bottom=5
        text.margin.left=5
        text.margin.right=5
        indicator.size=0

        [Dock] 
        interior.element=toolbar
        frame.element=toolbar
        frame=true
        interior=true

        [GroupBox]
        inherits=PanelButtonCommand
        interior.element=tabframe
        interior=true
        frame=false

        [Focus]
        inherits=PanelButtonCommand
        frame=true
        frame.element=focus
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1
        frame.patternsize=20

        [GenericFrame]
        inherits=PanelButtonCommand
        frame.element=common
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1

        [Slider]
        inherits=PanelButtonCommand
        interior=true
        frame.element=slider
        interior.element=slider
        frame.top=3
        frame.bottom=3
        frame.left=3
        frame.right=3
        focusFrame=true

        [SliderCursor]
        inherits=PanelButtonCommand
        interior=true
        interior.element=slidercursor
        frame=false

        [LineEdit]
        inherits=PanelButtonCommand
        frame.element=lineedit
        interior.element=lineedit

        [IndicatorSpinBox]
        inherits=LineEdit
        frame.element=lineedit
        interior.element=lineedit
        frame.top=0
        frame.bottom=2
        frame.left=2
        frame.right=2
        indicator.size=8

        [DropDownButton]
        inherits=PanelButtonCommand
        frame.top=2
        frame.bottom=2
        frame.left=0
        frame.right=1
        indicator.size=8

        [ToolboxTab]
        inherits=PanelButtonCommand
        frame.element=tabframe
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1

        [Tab]
        inherits=PanelButtonCommand
        interior.element=tab
        frame.element=tab
        frame.top=2
        frame.bottom=3
        frame.left=3
        frame.right=3
        indicator.size=10
        text.normal.color=#${base04}
        text.focus.color=#${base05}
        text.press.color=#${base05}
        text.toggle.color=#${base05}
        focusFrame=true

        [TabBarFrame]
        inherits=GenericFrame
        frame=true
        frame.element=tabBarFrame
        interior=false
        frame.top=4
        frame.bottom=4
        frame.left=4
        frame.right=4

        [TabFrame]
        inherits=PanelButtonCommand
        frame.element=tabframe
        interior.element=tabframe

        [Dialog]
        inherits=TabBarFrame
        frame.element=tabframe
        interior=false
        frame=false
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1

        [HeaderSection]
        inherits=PanelButtonCommand
        interior.element=header
        frame.element=header
        frame.top=0
        frame.bottom=1
        frame.left=1
        frame.right=1
        frame.expansion=0
        text.normal.color=#${base05}
        text.focus.color=#${base07}
        text.press.color=#${base05}
        text.toggle.color=#${base05}
        indicator.element=harrow

        [SizeGrip]
        inherits=PanelButtonCommand
        frame=false
        interior=false
        indicator.element=resize-grip
        indicator.size=0

        [Toolbar]
        inherits=PanelButtonCommand
        interior.element=menubar
        frame.element=menubar
        frame=true
        frame.bottom=4
        frame.left=4
        frame.right=4
        text.normal.color=#${base05}
        text.focus.color=#${base05}
        text.press.color=#${base07}
        text.toggle.color=#${base07}
        text.bold=false

        [MenuBar]
        inherits=PanelButtonCommand
        frame.element=menubar
        interior.element=menubar
        frame.bottom=0
        text.normal.color=#${base05}
        frame.expansion=0
        text.bold=false

        [ToolbarButton]
        frame.element=tbutton
        interior.element=tbutton
        indicator.element=arrow
        text.normal.color=#${base05}
        text.focus.color=#${base05}
        text.press.color=#${base01}
        text.toggle.color=#${base01}
        text.bold=false

        [Scrollbar]
        inherits=PanelButtonCommand
        indicator.size=0
        interior=false
        frame=false

        [ScrollbarGroove]
        inherits=PanelButtonCommand
        interior=false
        frame=false

        [ScrollbarSlider]
        inherits=PanelButtonCommand
        interior=false
        frame.element=scrollbarslider
        frame.top=4
        frame.bottom=4
        frame.left=4
        frame.right=4

        [ProgressbarContents]
        inherits=PanelButtonCommand
        frame=true
        frame.element=progress-pattern
        interior.element=progress-pattern
        frame.top=2
        frame.bottom=2
        frame.left=2
        frame.right=2

        [Progressbar]
        inherits=PanelButtonCommand
        frame.element=progress
        interior.element=progress
        frame.top=2
        frame.bottom=2
        frame.left=2
        frame.right=2
        text.margin=0
        text.normal.color=#${base05}
        text.focus.color=#${base05}
        text.press.color=#${base01}
        text.toggle.color=#${base01}
        text.bold=false
        frame.expansion=18

        [RadioButton]
        inherits=PanelButtonCommand

        [Menu]
        frame.element=menu
        interior.element=menu
        inherits=PanelButtonCommand
        text.press.color=#${base01}
        text.toggle.color=#${base01}
        text.bold=false
        frame.top=3
        frame.bottom=3
        frame.left=3
        frame.right=3

        [MenuItem]
        inherits=PanelButtonCommand
        interior.element=menuitem
        indicator.size=8
        text.focus.color=#${base05}
        text.press.color=#${base05}

        [MenuBarItem]
        inherits=PanelButtonCommand
        interior.element=menubaritem
        frame=false
        text.margin.top=3
        text.margin.bottom=3
        text.margin.left=5
        text.margin.right=5

        [StatusBar]
        inherits=Toolbar
        frame.element=toolbar
        font.bold=true
        text.normal.color=#${base05}
        frame=true
        frame.top=0
        frame.bottom=0

        [TitleBar]
        inherits=PanelButtonCommand
        frame=false
        interior=false
        text.margin.top=2
        text.margin.bottom=2
        text.margin.left=3
        text.margin.right=3

        [ComboBox]
        inherits=PanelButtonCommand
        indicator.size=8
        frame.top=3
        frame.bottom=3
        frame.left=3
        frame.right=3
        text.margin.top=1
        text.margin.bottom=1
        text.margin.left=3
        text.margin.right=3
        text.toggle.color=#${base05}

        [ToolboxTab]
        inherits=PanelButtonCommand
        text.normal.color=#${base05}
        text.press.color=#${base05}
        text.focus.color=#${base05}

        [Hacks]
        transparent_dolphin_view=false
        blur_konsole=true
        transparent_ktitle_label=true
        transparent_menutitle=true
        respect_darkness=true
        kcapacitybar_as_progressbar=true
        force_size_grip=false
        iconless_pushbutton=true
        iconless_menu=false
        disabled_icon_opacity=100
        lxqtmainmenu_iconsize=0
        normal_default_pushbutton=true
        single_top_toolbar=false
        tint_on_mouseover=0
        transparent_pcmanfm_sidepane=true
        transparent_pcmanfm_view=false
        blur_translucent=true
        centered_forms=false
        kinetic_scrolling=false
        middle_click_scroll=false
        no_selection_tint=false
        noninteger_translucency=false
        style_vertical_toolbars=false
        blur_only_active_window=false

        [Window]
        interior=true
        interior.element=window
        frame.top=0
        frame.bottom=0
        frame.left=0
        frame.right=0
      '';

      "Kvantum/HomeManager/HomeManager.svg".text = with config.colorScheme.colors; ''
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="845" height="695" version="1">
         <defs>
          <defs>
           <linearGradient id="linearGradient1304" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1768"/>
           <linearGradient id="linearGradient1266">
            <stop style="stop-color:#000000;stop-opacity:0.3137255" offset="0"/>
            <stop style="stop-color:#000000;stop-opacity:0" offset="1"/>
           </linearGradient>
           <linearGradient id="linearGradient1272">
            <stop style="stop-color:#${base05};stop-opacity:0.69072163" offset="0"/>
            <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
           </linearGradient>
           <radialGradient id="radialGradient1278" cx="522.895" cy="481.866" r="15.301" fx="522.899" fy="473.033" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1702"/>
           <linearGradient id="linearGradient1279" x1="522.942" x2="522.942" y1="469.499" y2="505.084" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1697"/>
           <linearGradient id="linearGradient1280" x1="213.828" x2="214.592" y1="183.484" y2="463.473" gradientTransform="matrix(1.5539,0,0,0.643542,-1.017928,0)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1702"/>
           <linearGradient id="linearGradient1281" x1="520.572" x2="520.572" y1="506.287" y2="466.279" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1697"/>
           <linearGradient id="linearGradient1282" x1="522.942" x2="522.942" y1="469.499" y2="505.084" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1697"/>
           <linearGradient id="linearGradient1283" x1="44.931" x2="45.512" y1="56.725" y2="185.057" gradientTransform="matrix(1.694118,0,0,0.651906,0,-2.410339)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1702"/>
           <linearGradient id="linearGradient1284" x1="520.572" x2="520.572" y1="506.287" y2="466.279" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1735"/>
           <linearGradient id="linearGradient1285" x1="27.12" x2="27.018" y1="-353.759" y2="-316.477" gradientTransform="scale(2.89873,-0.344979)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1702"/>
           <radialGradient id="radialGradient1286" cx="41.876" cy="37.866" r="12.563" fx="42.024" fy="37.866" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1845"/>
           <linearGradient id="linearGradient1287" x1="10.686" x2="11.66" y1="22.703" y2="4.104" gradientTransform="scale(1.016203,0.984055)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1302"/>
           <linearGradient id="linearGradient1288" x1="16.884" x2="12.517" y1="28.773" y2="2.602" gradientTransform="scale(1.016203,0.984055)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1305"/>
           <defs>
            <linearGradient id="linearGradient1290" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient2002"/>
            <linearGradient id="linearGradient1291" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient2009"/>
            <linearGradient id="linearGradient1292" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient2006"/>
            <linearGradient id="linearGradient1296">
             <stop style="stop-color:#${base05}" offset="0"/>
             <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
            </linearGradient>
            <linearGradient id="linearGradient1299">
             <stop style="stop-color:#000000;stop-opacity:0.14835165" offset="0"/>
             <stop style="stop-color:#7f7f7f;stop-opacity:0.49803922" offset=".5"/>
             <stop style="stop-color:#bfbfbf;stop-opacity:0.34705882" offset=".75"/>
             <stop style="stop-color:#${base05};stop-opacity:0.12156863" offset=".875"/>
             <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
            </linearGradient>
            <linearGradient id="linearGradient1309" x1="28.814" x2="47.366" y1="-1.616" y2="22.77" gradientTransform="scale(0.764292,1.3084)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
            <linearGradient id="linearGradient1310" x1="30.723" x2="39.781" y1="28.135" y2="27.315" gradientTransform="scale(0.475459,2.103232)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
            <linearGradient id="linearGradient1311" x1="30.382" x2="47.366" y1="7.533" y2="22.77" gradientTransform="matrix(0.479578,0,0,0.81043,36.76785,3.324472)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
            <linearGradient id="linearGradient1312" x1="25.955" x2="39.782" y1="25.071" y2="27.315" gradientTransform="scale(0.475459,2.103231)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
            <defs>
             <linearGradient id="linearGradient1314" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1302"/>
             <linearGradient id="linearGradient1315" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1305"/>
             <linearGradient id="linearGradient1319" x1=".284" x2=".325" y1=".883" y2=".105" xlink:href="#linearGradient4114"/>
             <linearGradient id="linearGradient1320" x1="-.008" x2=".596" y1="-1.245" y2=".361" xlink:href="#linearGradient1513"/>
             <linearGradient id="linearGradient1321" x1="-.451" x2=".471" y1="-.151" y2=".366" xlink:href="#linearGradient1513"/>
             <linearGradient id="linearGradient1322" x1=".459" x2=".69" y1="1.277" y2="-.297" xlink:href="#linearGradient2122"/>
             <linearGradient id="linearGradient1323" x1="-.182" x2=".685" y1="-.44" y2=".424" xlink:href="#linearGradient1513"/>
             <linearGradient id="linearGradient1324">
              <stop style="stop-color:#000000;stop-opacity:0.40784314" offset="0"/>
              <stop style="stop-color:#000000;stop-opacity:0" offset="1"/>
             </linearGradient>
             <linearGradient id="linearGradient1327" x1="1.378" x2=".584" y1=".254" y2=".13" xlink:href="#linearGradient2122"/>
             <linearGradient id="linearGradient1328" x1="-.142" x2=".498" y1="-.288" y2=".356" xlink:href="#linearGradient1513"/>
             <linearGradient id="linearGradient1329" x1=".995" x2=".327" y1=".644" y2=".3" xlink:href="#linearGradient1918"/>
             <linearGradient id="linearGradient1330" x1=".278" x2=".451" y1="-.064" y2=".611" xlink:href="#linearGradient1513"/>
             <linearGradient id="linearGradient1331">
              <stop style="stop-color:#d6d6d6" offset="0"/>
              <stop style="stop-color:#eaeaea" offset=".258"/>
              <stop style="stop-color:#919191" offset=".706"/>
              <stop style="stop-color:#d2d2d2" offset=".733"/>
              <stop style="stop-color:#a6a6a6" offset="1"/>
             </linearGradient>
             <linearGradient id="linearGradient1337" x1=".475" x2=".804" y1=".218" y2=".52" xlink:href="#linearGradient2317"/>
             <linearGradient id="linearGradient1338">
              <stop style="stop-color:#${base05}" offset="0"/>
              <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
             </linearGradient>
             <linearGradient id="linearGradient1341" x1=".416" x2=".596" y1=".277" y2=".443" xlink:href="#linearGradient1513"/>
             <radialGradient id="radialGradient1342" cx=".5" cy=".5" r=".5" fx=".384" fy=".476" xlink:href="#linearGradient1918"/>
             <linearGradient id="linearGradient1343" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1845"/>
             <radialGradient id="radialGradient1344" cx=".5" cy=".5" r=".5" fx=".506" fy=".5" xlink:href="#linearGradient1918"/>
             <linearGradient id="linearGradient1345" x1=".544" x2=".361" y1="1.137" y2=".042" xlink:href="#linearGradient4111"/>
            </defs>
           </defs>
           <radialGradient id="radialGradient1397" cx="41.876" cy="37.866" r="12.563" fx="42.024" fy="37.866" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2002"/>
           <linearGradient id="linearGradient1303" x1="240.862" x2="240.862" y1="635.747" y2="1038.944" gradientTransform="matrix(1.475472,0,0,0.677749,-32.57368,52.93652)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1683"/>
           <defs>
            <linearGradient id="linearGradient1694">
             <stop style="stop-color:#${base05};stop-opacity:0" offset="0"/>
             <stop style="stop-color:#${base05}" offset="1"/>
            </linearGradient>
            <linearGradient id="linearGradient1683" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1304"/>
            <linearGradient id="linearGradient1686" x1="242.398" x2="242.398" y1="1035.334" y2="636.255" gradientTransform="scale(1.475472,0.677749)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1683"/>
            <linearGradient id="linearGradient1690" x1="240.862" x2="240.862" y1="635.747" y2="1038.944" gradientTransform="scale(1.475472,0.677749)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1683"/>
            <linearGradient id="linearGradient1692" x1="244.86" x2="244.86" y1="827.013" y2="646.062" gradientTransform="scale(1.479463,0.675921)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1694"/>
            <linearGradient id="linearGradient1249" x1="242.398" x2="242.398" y1="1035.334" y2="636.255" gradientTransform="scale(1.475472,0.677749)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1683"/>
            <linearGradient id="linearGradient1251" x1="244.86" x2="244.86" y1="827.013" y2="646.062" gradientTransform="scale(1.479463,0.675921)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient1694"/>
           </defs>
          </defs>
          <defs>
           <linearGradient id="linearGradient1845" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient2002"/>
           <linearGradient id="linearGradient1305" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient2009"/>
           <linearGradient id="linearGradient1302" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient2006"/>
           <linearGradient id="linearGradient2354">
            <stop style="stop-color:#${base05}" offset="0"/>
            <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
           </linearGradient>
           <linearGradient id="linearGradient1778">
            <stop style="stop-color:#000000;stop-opacity:0.14835165" offset="0"/>
            <stop style="stop-color:#7f7f7f;stop-opacity:0.49803922" offset=".5"/>
            <stop style="stop-color:#bfbfbf;stop-opacity:0.34705882" offset=".75"/>
            <stop style="stop-color:#${base05};stop-opacity:0.12156863" offset=".875"/>
            <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
           </linearGradient>
           <linearGradient id="linearGradient2353" x1="28.814" x2="47.366" y1="-1.616" y2="22.77" gradientTransform="scale(0.764292,1.3084)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
           <linearGradient id="linearGradient2358" x1="30.723" x2="39.781" y1="28.135" y2="27.315" gradientTransform="scale(0.475459,2.103232)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
           <linearGradient id="linearGradient2360" x1="30.382" x2="47.366" y1="7.533" y2="22.77" gradientTransform="matrix(0.479578,0,0,0.81043,36.76785,3.324472)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
           <linearGradient id="linearGradient2368" x1="25.955" x2="39.782" y1="25.071" y2="27.315" gradientTransform="scale(0.475459,2.103231)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient2354"/>
           <defs>
            <linearGradient id="linearGradient4114" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1302"/>
            <linearGradient id="linearGradient4111" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1305"/>
            <linearGradient id="linearGradient2222" x1=".284" x2=".325" y1=".883" y2=".105" xlink:href="#linearGradient4114"/>
            <linearGradient id="linearGradient2313" x1="-.008" x2=".596" y1="-1.245" y2=".361" xlink:href="#linearGradient1513"/>
            <linearGradient id="linearGradient2314" x1="-.451" x2=".471" y1="-.151" y2=".366" xlink:href="#linearGradient1513"/>
            <linearGradient id="linearGradient1516" x1=".459" x2=".69" y1="1.277" y2="-.297" xlink:href="#linearGradient2122"/>
            <linearGradient id="linearGradient2223" x1="-.182" x2=".685" y1="-.44" y2=".424" xlink:href="#linearGradient1513"/>
            <linearGradient id="linearGradient2122">
             <stop style="stop-color:#000000;stop-opacity:0.40784314" offset="0"/>
             <stop style="stop-color:#000000;stop-opacity:0" offset="1"/>
            </linearGradient>
            <linearGradient id="linearGradient2138" x1="1.378" x2=".584" y1=".254" y2=".13" xlink:href="#linearGradient2122"/>
            <linearGradient id="linearGradient2224" x1="-.142" x2=".498" y1="-.288" y2=".356" xlink:href="#linearGradient1513"/>
            <linearGradient id="linearGradient1512" x1=".995" x2=".327" y1=".644" y2=".3" xlink:href="#linearGradient1918"/>
            <linearGradient id="linearGradient2315" x1=".278" x2=".451" y1="-.064" y2=".611" xlink:href="#linearGradient1513"/>
            <linearGradient id="linearGradient2317">
             <stop style="stop-color:#d6d6d6" offset="0"/>
             <stop style="stop-color:#eaeaea" offset=".258"/>
             <stop style="stop-color:#919191" offset=".706"/>
             <stop style="stop-color:#d2d2d2" offset=".733"/>
             <stop style="stop-color:#a6a6a6" offset="1"/>
            </linearGradient>
            <linearGradient id="linearGradient2316" x1=".475" x2=".804" y1=".218" y2=".52" xlink:href="#linearGradient2317"/>
            <linearGradient id="linearGradient1513">
             <stop style="stop-color:#${base05}" offset="0"/>
             <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
            </linearGradient>
            <linearGradient id="linearGradient2121" x1=".416" x2=".596" y1=".277" y2=".443" xlink:href="#linearGradient1513"/>
            <radialGradient id="radialGradient2541" cx=".5" cy=".5" r=".5" fx=".384" fy=".476" xlink:href="#linearGradient1918"/>
            <linearGradient id="linearGradient1918" x1="0" x2="1" y1=".5" y2=".5" gradientUnits="objectBoundingBox" spreadMethod="pad" xlink:href="#linearGradient1845"/>
            <radialGradient id="radialGradient1502" cx=".5" cy=".5" r=".5" fx=".506" fy=".5" xlink:href="#linearGradient1918"/>
            <linearGradient id="linearGradient2312" x1=".544" x2=".361" y1="1.137" y2=".042" xlink:href="#linearGradient4111"/>
           </defs>
          </defs>
          <linearGradient id="linearGradient1702">
           <stop style="stop-color:#${base05};stop-opacity:0.69072163" offset="0"/>
           <stop style="stop-color:#${base05};stop-opacity:0" offset="1"/>
          </linearGradient>
          <linearGradient id="linearGradient2002">
           <stop style="stop-color:#000000;stop-opacity:0.3137255" offset="0"/>
           <stop style="stop-color:#000000;stop-opacity:0" offset="1"/>
          </linearGradient>
          <linearGradient id="selected_bg_color" gradientTransform="translate(91,-40.99999)">
           <stop style="stop-color:#${base07}" offset="0"/>
          </linearGradient>
          <radialGradient id="radialGradient11175" cx="525" cy="330" r="5" fx="525" fy="330" gradientTransform="matrix(0,-1.4,2,0,-135,1065)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <linearGradient id="linearGradient3893">
           <stop style="stop-color:#000000" offset="0"/>
           <stop style="stop-color:#000000;stop-opacity:0" offset="1"/>
          </linearGradient>
          <linearGradient id="linearGradient11121" x1="532" x2="532" y1="330" y2="323" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <linearGradient id="linearGradient11133" x1="525" x2="515" y1="348" y2="348" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <radialGradient id="radialGradient11173" cx="571" cy="330" r="5" fx="571" fy="330" gradientTransform="matrix(2,0,0,1.4,-571,-132)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <linearGradient id="linearGradient11125" x1="571" x2="581" y1="351" y2="351" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <radialGradient id="radialGradient11177" cx="525" cy="373" r="5" fx="525" fy="373" gradientTransform="matrix(-2,0,0,-2,1575,1119)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <linearGradient id="linearGradient11129" x1="533" x2="533" y1="373" y2="383" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <radialGradient id="radialGradient11179" cx="571" cy="373" r="5" fx="571" fy="373" gradientTransform="matrix(0,2,-2,0,1317,-769)" gradientUnits="userSpaceOnUse" xlink:href="#linearGradient3893"/>
          <linearGradient id="linearGradient2266" x1="18" x2="32" y1="31.36" y2="31.36" gradientUnits="userSpaceOnUse" xlink:href="#selected_bg_color"/>
          <linearGradient id="linearGradient2268" x1="18" x2="32" y1="31.36" y2="31.36" gradientUnits="userSpaceOnUse" xlink:href="#selected_bg_color"/>
          <linearGradient id="linearGradient2270" x1="51.199" x2="80.35" y1="127.576" y2="127.576" gradientTransform="scale(1.0080248,0.9920391)" gradientUnits="userSpaceOnUse" xlink:href="#selected_bg_color"/>
          <linearGradient id="linearGradient2272" x1="18" x2="32" y1="31.36" y2="31.36" gradientUnits="userSpaceOnUse" xlink:href="#selected_bg_color"/>
          <linearGradient id="linearGradient2274" x1="18" x2="32" y1="31.36" y2="31.36" gradientUnits="userSpaceOnUse" xlink:href="#selected_bg_color"/>
          <linearGradient id="linearGradient2276" x1="51.199" x2="80.35" y1="127.576" y2="127.576" gradientTransform="scale(1.0080248,0.9920391)" gradientUnits="userSpaceOnUse" xlink:href="#selected_bg_color"/>
         </defs>
         <g id="menuitem-tearoff-normal" transform="translate(569.22443,-600.73382)">
          <rect style="opacity:0;fill:#141414" width="7" height="9" x="686.5" y="-229.5" transform="rotate(90)"/>
          <path style="fill:#${base02}" d="m 227.2385,689 h -2.2462 v 2 h 2.2462 z m -4.4924,0 H 220.5 v 2 h 2.2461 z"/>
         </g>
         <g id="menuitem-tearoff-focused" transform="translate(591.22443,-600.73382)">
          <rect style="opacity:0;fill:#141414" width="7" height="9" x="686.5" y="-229.5" transform="rotate(90)"/>
          <path style="fill:#${base01}" d="m 227.2385,689 h -2.2462 v 2 h 2.2462 z m -4.4924,0 H 220.5 v 2 h 2.2461 z"/>
         </g>
         <g id="dial" transform="matrix(0.95744681,0,0,0.95744681,359.41894,236.51316)">
          <rect id="dial-handle-4" style="opacity:0.00100002;fill:none;stroke:#000000;stroke-width:1.04444" width="10.444" height="10.444" x="104.86" y="228.25" rx="5.222" ry="5.222"/>
         </g>
         <g id="dial-notches" style="fill:#${base05}" transform="translate(-158.89134,-161.46256)">
          <rect style="opacity:0" width="45" height="45" x="202.5" y="667.5"/>
          <path id="dial-notches0" style="opacity:0.3" d="m 214.625,670 -1.75,1 2.25,3.9063 1.75,-1 z m 20.75,0 -2.25,3.9063 1.75,1 2.25,-3.9063 z M 202.5,689 v 2 h 4.5 v -2 z m 40.5,0 v 2 h 4.5 v -2 z m -27.875,16.0938 -2.25,3.9062 1.75,1 2.25,-3.9062 z m 19.75,0 -1.75,1 2.25,3.9062 1.75,-1 z"/>
          <path style="opacity:0.3" d="m 222.9062,667.5938 -0.5,0.0625 0.3125,2.9688 0.5,-0.0312 -0.3125,-3 z m 4.1875,0 -0.3125,3 0.5,0.0312 0.3125,-2.9688 -0.5,-0.0625 z m -8.8125,0.9375 -0.4688,0.1562 0.9375,2.8438 0.4688,-0.1562 z m 13.4375,0 -0.9375,2.8438 0.4688,0.1562 0.9375,-2.8438 z m -21.5938,4.5938 -0.375,0.3125 2.0312,2.25 0.3438,-0.3438 -2,-2.2188 z m 29.75,0 -2,2.2188 0.3438,0.3438 2.0312,-2.25 -0.375,-0.3125 z m -32.9375,3.4375 -0.2812,0.4062 2.4062,1.7812 0.3125,-0.4062 z m 36.125,0 -2.4375,1.7812 0.3125,0.4062 2.4062,-1.7812 z m -38.5,4.0625 -0.2188,0.4375 2.75,1.25 0.1875,-0.4688 -2.7188,-1.2188 z m 40.875,0 -2.7188,1.2188 0.1875,0.4688 2.75,-1.25 -0.2188,-0.4375 z m -42.4062,4.4375 -0.0937,0.5 2.9375,0.625 0.0937,-0.5 z m 43.9375,0 -2.9375,0.625 0.0937,0.5 2.9375,-0.625 z m -41.0938,8.75 -2.9375,0.625 0.0937,0.5 2.9375,-0.625 z m 38.25,0 -0.0937,0.5 2.9375,0.625 0.0937,-0.5 z m -37.0312,3.875 -2.75,1.25 0.2188,0.4375 2.7188,-1.2188 -0.1875,-0.4688 z m 35.8125,0 -0.1875,0.4688 2.7188,1.2188 0.2188,-0.4375 -2.75,-1.25 z m -33.8438,3.5625 -2.4062,1.7812 0.2812,0.4062 2.4375,-1.7812 z m 31.875,0 -0.3125,0.4062 2.4375,1.7812 0.2812,-0.4062 z m -29.1562,3.0625 -2.0312,2.25 0.375,0.3125 2,-2.2188 -0.3438,-0.3438 z m 26.4375,0 -0.3438,0.3438 2,2.2188 0.375,-0.3125 -2.0312,-2.25 z"/>
         </g>
         <rect id="grip-normal" style="opacity:0" width="5" height="5" x="549.3" y="636.64"/>
         <rect id="grip-focused" style="opacity:0" width="5" height="5" x="579.3" y="636.64"/>
         <rect id="grip-pressed" style="opacity:0" width="5" height="5" x="609.3" y="636.64"/>
         <g id="itemview-toggled-left" transform="matrix(0.44036689,0,0,-1.999996,510.85999,2181.7643)">
          <rect style="opacity:0.212;fill:#${base07}" width="2" height="21" x="-721.81" y="789.58"/>
         </g>
         <g id="itemview-toggled-bottom" transform="matrix(0.84070043,0,0,-1.1999995,799.02299,1538.1001)">
          <rect style="opacity:0.212;fill:#${base07}" width="55" height="2" x="-719.81" y="777.58"/>
         </g>
         <rect id="itemview-toggled-top" style="opacity:0.212;fill:#${base07}" width="46.239" height="3.6" x="193.88" y="-560.6" transform="scale(1,-1)"/>
         <g id="itemview-toggled-right" transform="matrix(0.44036689,0,0,-1.999996,532.87829,2181.7643)">
          <rect style="opacity:0.212;fill:#${base07}" width="2" height="21" x="-664.81" y="789.58"/>
         </g>
         <rect id="itemview-toggled" style="opacity:0.212;fill:#${base07}" width="46.239" height="42" x="193.88" y="-602.6" transform="scale(1,-1)"/>
         <path id="itemview-toggled-topleft" style="opacity:0.212;fill:#${base07}" d="m 193.88074,556.99973 c -0.48641,0 -0.88073,1.0745 -0.88073,2.4 v 1.2 h 0.88073 v -1.2 z"/>
         <path id="itemview-toggled-bottomright" style="opacity:0.212;fill:#${base07}" d="m 241,602.59961 a 0.88073379,2.3999989 0 0 1 -0.88074,2.4 v -2.4 z"/>
         <path id="itemview-toggled-bottomleft" style="opacity:0.212;fill:#${base07}" d="m 193,602.59961 a 0.88073379,2.3999989 0 0 0 0.88074,2.4 v -2.4 z"/>
         <path id="itemview-toggled-topright" style="opacity:0.212;fill:#${base07}" d="m 240.11927,556.99973 c 0.48641,0 0.88073,1.0745 0.88073,2.4 v 1.2 h -0.88073 v -1.2 z"/>
         <g id="toolbar-normal-top" transform="matrix(0.83636363,0,0,0.5,616.0229,-304.79001)">
          <path style="fill:#${base01}" transform="matrix(1.25,0,0,2,-738.56,609.52204)" d="m 15,84.029297 v 0.5 0.5 h 44 v -0.5 -0.5 z"/>
         </g>
         <rect id="toolbar-normal" style="fill:#${base01}" width="46" height="46" x="14" y="85"/>
         <g id="itemview-pressed-left" transform="matrix(0.44036689,0,0,-1.999996,588.86,2181.7643)">
          <rect style="opacity:0.212;fill:#${base07}" width="2" height="21" x="-721.81" y="789.58"/>
         </g>
         <g id="itemview-pressed-bottom" transform="matrix(0.84070043,0,0,-1.1999995,877.02311,1538.1001)">
          <rect style="opacity:0.212;fill:#${base07}" width="55" height="2" x="-719.81" y="777.58"/>
         </g>
         <rect id="itemview-pressed-top" style="opacity:0.212;fill:#${base07}" width="46.239" height="3.6" x="271.88" y="-560.6" transform="scale(1,-1)"/>
         <g id="itemview-pressed-right" transform="matrix(0.44036689,0,0,-1.999996,610.8783,2181.7643)">
          <rect style="opacity:0.212;fill:#${base07}" width="2" height="21" x="-664.81" y="789.58"/>
         </g>
         <rect id="itemview-pressed" style="opacity:0.212;fill:#${base07}" width="46.239" height="42" x="271.88" y="-602.6" transform="scale(1,-1)"/>
         <path id="itemview-pressed-topleft" style="opacity:0.212;fill:#${base07}" d="m 271.88074,556.99973 c -0.48641,0 -0.88073,1.0745 -0.88073,2.4 v 1.2 h 0.88073 v -1.2 z"/>
         <path id="itemview-pressed-bottomright" style="opacity:0.212;fill:#${base07}" d="m 319,602.59961 a 0.88073379,2.3999989 0 0 1 -0.88074,2.4 v -2.4 z"/>
         <path id="itemview-pressed-bottomleft" style="opacity:0.212;fill:#${base07}" d="m 271,602.59961 a 0.88073379,2.3999989 0 0 0 0.88074,2.4 v -2.4 z"/>
         <path id="itemview-pressed-topright" style="opacity:0.212;fill:#${base07}" d="m 318.11927,556.99973 c 0.48641,0 0.88073,1.0745 0.88073,2.4 v 1.2 h -0.88073 v -1.2 z"/>
         <g id="splitter-grip-focused" style="opacity:0" transform="translate(502.42498,-393.92675)">
          <path style="fill:#${base07}" d="m 227.5,690 c 0,1.3807 -1.11929,2.5 -2.5,2.5 -1.38071,0 -2.5,-1.1193 -2.5,-2.5 0,-1.3807 1.11929,-2.5 2.5,-2.5 1.38071,0 2.5,1.1193 2.5,2.5 z"/>
          <g style="fill:#${base07}">
           <path style="fill:#${base07}" d="m 226.9643,683.9643 c 0,1.0848 -0.87944,1.9643 -1.96429,1.9643 -1.08484,0 -1.96428,-0.8795 -1.96428,-1.9643 0,-1.0849 0.87944,-1.9643 1.96428,-1.9643 1.08485,0 1.96429,0.8794 1.96429,1.9643 z"/>
           <path style="fill:#${base07}" d="m 226.9643,696.0357 c 0,1.0848 -0.87944,1.9643 -1.96429,1.9643 -1.08484,0 -1.96428,-0.8795 -1.96428,-1.9643 0,-1.0849 0.87944,-1.9643 1.96428,-1.9643 1.08485,0 1.96429,0.8794 1.96429,1.9643 z"/>
          </g>
         </g>
         <g id="splitter-grip-pressed" style="opacity:0" transform="translate(515.66069,-421.12141)">
          <path style="fill:#${base07}" d="m 227.5,690 c 0,1.3807 -1.11929,2.5 -2.5,2.5 -1.38071,0 -2.5,-1.1193 -2.5,-2.5 0,-1.3807 1.11929,-2.5 2.5,-2.5 1.38071,0 2.5,1.1193 2.5,2.5 z"/>
          <g style="fill:#${base07}">
           <path style="fill:#${base07}" d="m 226.9643,683.9643 c 0,1.0848 -0.87944,1.9643 -1.96429,1.9643 -1.08484,0 -1.96428,-0.8795 -1.96428,-1.9643 0,-1.0849 0.87944,-1.9643 1.96428,-1.9643 1.08485,0 1.96429,0.8794 1.96429,1.9643 z"/>
           <path style="fill:#${base07}" d="m 226.9643,696.0357 c 0,1.0848 -0.87944,1.9643 -1.96429,1.9643 -1.08484,0 -1.96428,-0.8795 -1.96428,-1.9643 0,-1.0849 0.87944,-1.9643 1.96428,-1.9643 1.08485,0 1.96429,0.8794 1.96429,1.9643 z"/>
          </g>
         </g>
         <rect id="slider-topglow-normal" style="opacity:0.6;fill:#dcdcdc;fill-opacity:0" width="10" height="30" x="311.17" y="491.77"/>
         <use id="slider-bottomglow-normal" width="450" height="1380" x="0" y="0" transform="translate(39.999997)" xlink:href="#slider-topglow-normal"/>
         <g id="splitter-grip-normal" style="opacity:0" transform="translate(518.58485,-394.77228)">
          <path style="fill:#bebebe" d="m 227.5,690 c 0,1.3807 -1.11929,2.5 -2.5,2.5 -1.38071,0 -2.5,-1.1193 -2.5,-2.5 0,-1.3807 1.11929,-2.5 2.5,-2.5 1.38071,0 2.5,1.1193 2.5,2.5 z"/>
          <g style="fill:#${base07}">
           <path style="fill:#bebebe" d="m 226.9643,683.9643 c 0,1.0848 -0.87944,1.9643 -1.96429,1.9643 -1.08484,0 -1.96428,-0.8795 -1.96428,-1.9643 0,-1.0849 0.87944,-1.9643 1.96428,-1.9643 1.08485,0 1.96429,0.8794 1.96429,1.9643 z"/>
           <path style="fill:#bebebe" d="m 226.9643,696.0357 c 0,1.0848 -0.87944,1.9643 -1.96429,1.9643 -1.08484,0 -1.96428,-0.8795 -1.96428,-1.9643 0,-1.0849 0.87944,-1.9643 1.96428,-1.9643 1.08485,0 1.96429,0.8794 1.96429,1.9643 z"/>
          </g>
         </g>
         <path id="resize-grip-normal" style="opacity:0.00100002;fill:#b4b4b4" d="m 371.00039,90.896008 v 20.000002 h -20 z"/>
         <use id="resize-grip-focused" width="450" height="1380" x="0" y="0" transform="translate(50)" xlink:href="#resize-grip-normal"/>
         <g id="spin-normal-topright" transform="matrix(0.44036669,0,0,1.2307681,1024.3509,-687.15795)">
          <path style="opacity:0" d="m -664.80709,777.58403 c 1.10457,0 2,0.89543 2,2 h -1 c 0,-0.55228 -0.44772,-1 -1,-1 z"/>
          <path style="opacity:0.1;fill:#31363b" transform="matrix(0.5,0,0,-0.5,-744.80709,700.08403)" d="m 162,-159 a 2,2 0 0 1 -2,2 v -2 z"/>
         </g>
         <g id="slidercursor-focused" transform="matrix(1.2,0,0,1.2,638.8,-15.800242)">
          <rect style="opacity:0.00100002;fill-opacity:0.00392157" width="24" height="24" x="14" y="42" transform="matrix(0.83333333,0,0,0.83333333,-5.6666667,-6)"/>
          <circle style="fill:#${base01}" cx="14" cy="40" r="4" transform="matrix(2.0833333,0,0,2.0833333,-13.166666,-44.333332)"/>
          <circle style="fill:#${base03}" cx="14" cy="40" r="4" transform="matrix(1.875,0,0,1.875,-10.25,-36)"/>
         </g>
         <g id="slidercursor-pressed" transform="matrix(1.2,0,0,1.2,668.8,-15.800242)">
          <rect style="opacity:0.00100002;fill-opacity:0.00392157" width="24" height="24" x="14" y="42" transform="matrix(0.83333333,0,0,0.83333333,-5.6666667,-6)"/>
          <circle style="fill:#${base07}" cx="14" cy="40" r="4" transform="matrix(2.0833333,0,0,2.0833333,-13.166666,-44.333332)"/>
          <circle style="fill:#${base07}" cx="14" cy="40" r="4" transform="matrix(1.875,0,0,1.875,-10.25,-36)"/>
         </g>
         <g id="slidercursor-disabled" style="opacity:0.00100002" transform="matrix(1.2,0,0,1.2,699.8,-15.800242)">
          <rect style="opacity:0.00100002;fill-opacity:0.00392157" width="24" height="24" x="14" y="42" transform="matrix(0.83333333,0,0,0.83333333,-5.6666667,-6)"/>
          <circle style="fill:#${base01}" cx="14" cy="40" r="4" transform="matrix(2.0833333,0,0,2.0833333,-13.166666,-44.333332)"/>
          <circle style="fill:#${base02}" cx="14" cy="40" r="4" transform="matrix(1.875,0,0,1.875,-10.25,-36)"/>
         </g>
         <path id="slider-toggled-topleft" style="fill:#${base07};fill-rule:evenodd" d="m 530,7.9997563 c -6.648,0 -12,5.3519997 -12,11.9999997 h 12 z"/>
         <path id="slider-toggled-left" style="fill:#${base07};fill-rule:evenodd" d="m 518,19.999766 v 15.90889 0.0911 h 12 v -15.99973 h -12 z"/>
         <path id="slider-toggled-topright" style="fill:#${base07};fill-rule:evenodd" d="m 530,7.9997563 c 6.648,0 12,5.3519997 12,11.9999997 h -12 z"/>
         <path id="slider-toggled-right" style="fill:#${base07};fill-rule:evenodd" d="m 530,19.999766 v 15.90889 0.0911 h 12 v -15.99973 h -12 z"/>
         <path id="slider-normal-topleft" style="opacity:0.3;fill-rule:evenodd" d="m 499,8.9997562 c -6.648,0 -12,5.3519998 -12,11.9999998 h 12 z"/>
         <path id="slider-normal-left" style="opacity:0.3;fill-rule:evenodd" d="m 487,20.999806 v 15.90885 0.0911 h 12 v -15.99971 h -12 z"/>
         <path id="slider-normal-topright" style="opacity:0.3;fill-rule:evenodd" d="m 499,8.9997562 c 6.648,0 12,5.3519998 12,11.9999998 h -12 z"/>
         <path id="slider-normal-right" style="opacity:0.3;fill-rule:evenodd" d="m 499,20.999806 v 15.90885 0.0911 h 12 v -15.99971 h -12 z"/>
         <path id="slider-toggled-bottomleft" style="fill:#${base07};fill-rule:evenodd" d="m 530,47.999756 c -6.648,0 -12,-5.352 -12,-12 h 12 z"/>
         <path id="slider-toggled-bottomright" style="fill:#${base07};fill-rule:evenodd" d="m 530,47.999756 c 6.648,0 12,-5.352 12,-12 h -12 z"/>
         <path id="slider-normal-bottomleft" style="opacity:0.3;fill-rule:evenodd" d="m 499,48.999756 c -6.648,0 -12,-5.352 -12,-12 h 12 z"/>
         <path id="slider-normal-bottomright" style="opacity:0.3;fill-rule:evenodd" d="m 499,48.999756 c 6.648,0 12,-5.352 12,-12 h -12 z"/>
         <rect id="scrollbarslider-normal" style="fill:#${base02}" width="1" height="10" x="225" y="469"/>
         <g id="scrollbarslider-normal-right" transform="matrix(0.75,0,0,1,220.25,461.99976)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
          <rect style="opacity:0;fill:#${base02}" width="1" height="10" x="29" y="20" transform="matrix(1.3333333,0,0,1,-25.666667,-13)"/>
         </g>
         <g id="scrollbarslider-normal-topright" transform="matrix(0.75,0,0,0.75,220.25,462.74976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="26" y="15" transform="matrix(1.3333333,0,0,1.3333333,-25.666667,-18.333333)"/>
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,3 v 4 h 4 C 13,4.784 11.216,3 9,3 Z"/>
         </g>
         <g id="scrollbarslider-normal-bottomright" transform="matrix(0.75,0,0,0.75,220.25,467.24976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="26" y="31" transform="matrix(1.3333333,0,0,1.3333333,-25.666667,-24.333333)"/>
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,21 v -4 h 4 c 0,2.216 -1.784,4 -4,4 z"/>
         </g>
         <g id="scrollbarslider-normal-left" transform="matrix(-0.75,0,0,1,230.75,461.99976)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
          <rect style="opacity:0;fill:#${base03}" width="1" height="10" x="19" y="20" transform="matrix(-1.3333333,0,0,1,39.666667,-13)"/>
         </g>
         <g id="scrollbarslider-normal-topleft" transform="matrix(-0.75,0,0,0.75,230.75,462.74976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="19" y="15" transform="matrix(-1.3333333,0,0,1.3333333,39.666667,-18.333333)"/>
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,3 v 4 h 4 C 13,4.784 11.216,3 9,3 Z"/>
         </g>
         <g id="scrollbarslider-normal-bottomleft" transform="matrix(-0.75,0,0,0.75,230.75,467.24976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="19" y="31" transform="matrix(-1.3333333,0,0,1.3333333,39.666667,-24.333333)"/>
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,21 v -4 h 4 c 0,2.216 -1.784,4 -4,4 z"/>
         </g>
         <g id="scrollbarslider-normal-top" transform="matrix(0,-0.75,-0.1,0,226.7,474.74976)">
          <rect style="opacity:0.01;fill:#${base03}" width="1" height="4" x="24" y="15" transform="matrix(0,-10,-1.3333333,0,34.333333,257)"/>
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
         </g>
         <g id="scrollbarslider-normal-bottom" transform="matrix(0,0.75,-0.1,0,226.7,473.24976)">
          <rect style="opacity:0;fill:#${base03}" width="1" height="4" x="24" y="31" transform="matrix(0,-10,1.3333333,0,-32.333333,257)"/>
          <path style="fill:#${base02};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
         </g>
         <rect id="scrollbarslider-focused" style="fill:#${base04}" width="1" height="10" x="240" y="469"/>
         <g id="scrollbarslider-focused-right" transform="matrix(0.75,0,0,1,235.25,461.99976)">
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
          <rect style="opacity:0;fill:#${base03}" width="1" height="10" x="29" y="42" transform="matrix(1.3333333,0,0,1,-25.666667,-35)"/>
         </g>
         <g id="scrollbarslider-focused-topright" transform="matrix(0.75,0,0,0.75,235.25,462.74976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="26" y="37" transform="matrix(1.3333333,0,0,1.3333333,-25.666667,-47.666667)"/>
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,3 v 4 h 4 C 13,4.784 11.216,3 9,3 Z"/>
         </g>
         <g id="scrollbarslider-focused-bottomright" style="fill:#${base03}" transform="matrix(0.75,0,0,0.75,235.25,467.24976)">
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,21 v -4 h 4 c 0,2.216 -1.784,4 -4,4 z"/>
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="26" y="53" transform="matrix(1.3333333,0,0,1.3333333,-25.666667,-53.666667)"/>
         </g>
         <g id="scrollbarslider-focused-left" transform="matrix(-0.75,0,0,1,245.75,461.99976)">
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
          <rect style="opacity:0;fill:#${base03}" width="1" height="10" x="19" y="42" transform="matrix(-1.3333333,0,0,1,39.666667,-35)"/>
         </g>
         <g id="scrollbarslider-focused-topleft" transform="matrix(-0.75,0,0,0.75,245.75,462.74976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="19" y="37" transform="matrix(-1.3333333,0,0,1.3333333,39.666667,-47.666667)"/>
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,3 v 4 h 4 C 13,4.784 11.216,3 9,3 Z"/>
         </g>
         <g id="scrollbarslider-focused-bottomleft" transform="matrix(-0.75,0,0,0.75,245.75,467.24976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="19" y="53" transform="matrix(-1.3333333,0,0,1.3333333,39.666667,-53.666667)"/>
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,21 v -4 h 4 c 0,2.216 -1.784,4 -4,4 z"/>
         </g>
         <g id="scrollbarslider-focused-top" transform="matrix(0,-0.75,-0.1,0,241.7,474.74976)">
          <rect style="opacity:0;fill:#${base03}" width="1" height="4" x="24" y="37" transform="matrix(0,-10,-1.3333333,0,63.666667,257)"/>
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
         </g>
         <g id="scrollbarslider-focused-bottom" transform="matrix(0,0.75,-0.1,0,241.7,473.24976)">
          <rect style="opacity:0;fill:#${base03}" width="1" height="4" x="24" y="53" transform="matrix(0,-10,1.3333333,0,-61.666667,257)"/>
          <path style="fill:#${base04};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
         </g>
         <rect id="scrollbarslider-pressed" style="fill:#${base07}" width="1" height="10" x="255" y="469"/>
         <g id="scrollbarslider-pressed-right" transform="matrix(0.75,0,0,1,250.25,461.99976)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
          <rect style="opacity:0;fill:#${base03}" width="1" height="10" x="29" y="64" transform="matrix(1.3333333,0,0,1,-25.666667,-57)"/>
         </g>
         <g id="scrollbarslider-pressed-topright" transform="matrix(0.75,0,0,0.75,250.25,462.74976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="26" y="59" transform="matrix(1.3333333,0,0,1.3333333,-25.666667,-77)"/>
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,3 v 4 h 4 C 13,4.784 11.216,3 9,3 Z"/>
         </g>
         <g id="scrollbarslider-pressed-bottomright" transform="matrix(0.75,0,0,0.75,250.25,467.24976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="26" y="75" transform="matrix(1.3333333,0,0,1.3333333,-25.666667,-83)"/>
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,21 v -4 h 4 c 0,2.216 -1.784,4 -4,4 z"/>
         </g>
         <g id="scrollbarslider-pressed-left" transform="matrix(-0.75,0,0,1,260.75,461.99976)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
          <rect style="opacity:0;fill:#${base03}" width="1" height="10" x="19" y="64" transform="matrix(-1.3333333,0,0,1,39.666667,-57)"/>
         </g>
         <g id="scrollbarslider-pressed-topleft" transform="matrix(-0.75,0,0,0.75,260.75,462.74976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="19" y="59" transform="matrix(-1.3333333,0,0,1.3333333,39.666667,-77)"/>
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,3 v 4 h 4 C 13,4.784 11.216,3 9,3 Z"/>
         </g>
         <g id="scrollbarslider-pressed-bottomleft" transform="matrix(-0.75,0,0,0.75,260.75,467.24976)">
          <rect style="opacity:0;fill:#${base03}" width="4" height="4" x="19" y="75" transform="matrix(-1.3333333,0,0,1.3333333,39.666667,-83)"/>
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,21 v -4 h 4 c 0,2.216 -1.784,4 -4,4 z"/>
         </g>
         <g id="scrollbarslider-pressed-top" transform="matrix(0,-0.75,-0.1,0,256.7,474.74976)">
          <rect style="opacity:0;fill:#${base03}" width="1" height="4" x="24" y="59" transform="matrix(0,-10,-1.3333333,0,93,257)"/>
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
         </g>
         <g id="scrollbarslider-pressed-bottom" transform="matrix(0,0.75,-0.1,0,256.7,473.24976)">
          <rect style="opacity:0;fill:#${base03}" width="1" height="4" x="24" y="75" transform="matrix(0,-10,1.3333333,0,-91,257)"/>
          <path style="fill:#${base07};fill-rule:evenodd" d="m 9,7 v 10 h 4 V 7 Z"/>
         </g>
         <rect id="progress-pattern-normal" style="fill:#${base07}" width="30" height="30" x="419" y="13"/>
         <g id="progress-pattern-normal-left" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="98" y="-65" transform="rotate(90)"/>
          <path style="fill:#${base07}" d="m 64,98 v 30 h 1 V 98 Z"/>
         </g>
         <g id="progress-pattern-normal-topleft" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="63" y="96"/>
          <path style="fill:#${base07}" d="m 65,97 c -0.497258,0 -1,0.51007 -1,1 h 1 z"/>
         </g>
         <g id="progress-pattern-normal-topright" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="95" y="96"/>
          <path style="fill:#${base07}" d="m 95,97 c 0.49726,0 1,0.51007 1,1 h -1 z"/>
         </g>
         <g id="progress-pattern-normal-right" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="98" y="-97" transform="rotate(90)"/>
          <path style="fill:#${base07}" d="m 96,98 v 30 H 95 V 98 Z"/>
         </g>
         <g id="progress-pattern-normal-top" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="65" y="96"/>
          <rect style="fill:#${base07}" width="30" height="1" x="65" y="97"/>
         </g>
         <g id="progress-pattern-normal-bottomleft" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="63" y="128"/>
          <path style="fill:#${base07}" d="m 65,129 c -0.49726,0 -1,-0.51007 -1,-1 h 1 z"/>
         </g>
         <g id="progress-pattern-normal-bottomright" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="95" y="128"/>
          <path style="fill:#${base07}" d="m 95,129 c 0.49726,0 1,-0.51007 1,-1 h -1 z"/>
         </g>
         <g id="progress-pattern-normal-bottom" transform="translate(354,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="65" y="128"/>
          <rect style="fill:#${base07}" width="30" height="1" x="65" y="-129" transform="scale(1,-1)"/>
         </g>
         <rect id="progress-normal" style="opacity:0.3" width="30" height="30" x="378" y="13"/>
         <g id="progress-normal-left" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="98" y="-65" transform="rotate(90)"/>
          <path style="opacity:0.3" d="m 64,98 v 30 h 1 V 98 Z"/>
         </g>
         <g id="progress-normal-topleft" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="63" y="96"/>
          <path style="opacity:0.3" d="m 65,97 c -0.497258,0 -1,0.51007 -1,1 h 1 z"/>
         </g>
         <g id="progress-normal-topright" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="95" y="96"/>
          <path style="opacity:0.3" d="m 95,97 c 0.49726,0 1,0.51007 1,1 h -1 z"/>
         </g>
         <g id="progress-normal-right" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="98" y="-97" transform="rotate(90)"/>
          <path style="opacity:0.3" d="m 96,98 v 30 H 95 V 98 Z"/>
         </g>
         <g id="progress-normal-top" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="65" y="96"/>
          <rect style="opacity:0.3" width="30" height="1" x="65" y="97"/>
         </g>
         <g id="progress-normal-bottomleft" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="63" y="128"/>
          <path style="opacity:0.3" d="m 65,129 c -0.49726,0 -1,-0.51007 -1,-1 h 1 z"/>
         </g>
         <g id="progress-normal-bottomright" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="2" height="2" x="95" y="128"/>
          <path style="opacity:0.3" d="m 95,129 c 0.49726,0 1,-0.51007 1,-1 h -1 z"/>
         </g>
         <g id="progress-normal-bottom" transform="translate(313,-85.000244)">
          <rect style="opacity:0.00100002" width="30" height="2" x="65" y="128"/>
          <rect style="opacity:0.3" width="30" height="1" x="65" y="-129" transform="scale(1,-1)"/>
         </g>
         <g id="itemview-focused-left" transform="matrix(0.44036689,0,0,-1.999996,448.85999,2181.7643)">
          <rect style="opacity:0.2;fill:#${base07}" width="2" height="21" x="-721.81" y="789.58"/>
         </g>
         <g id="itemview-focused-bottom" transform="matrix(0.84070043,0,0,-1.1999995,737.02299,1538.1001)">
          <rect style="opacity:0.2;fill:#${base07}" width="55" height="2" x="-719.81" y="777.58"/>
         </g>
         <rect id="itemview-focused-top" style="opacity:0.2;fill:#${base07}" width="46.239" height="3.6" x="131.88" y="-560.6" transform="scale(1,-1)"/>
         <g id="itemview-focused-right" transform="matrix(0.44036689,0,0,-1.999996,470.87829,2181.7643)">
          <rect style="opacity:0.2;fill:#${base07}" width="2" height="21" x="-664.81" y="789.58"/>
         </g>
         <rect id="itemview-focused" style="opacity:0.2;fill:#${base07}" width="46.239" height="42" x="131.88" y="-602.6" transform="scale(1,-1)"/>
         <path id="itemview-focused-topleft" style="opacity:0.2;fill:#${base07}" d="m 131.88074,556.99973 c -0.48641,0 -0.88073,1.0745 -0.88073,2.4 v 1.2 h 0.88073 v -1.2 z"/>
         <path id="itemview-focused-bottomright" style="opacity:0.2;fill:#${base07}" d="m 179,602.59961 a 0.88073379,2.3999989 0 0 1 -0.88074,2.4 v -2.4 z"/>
         <path id="itemview-focused-bottomleft" style="opacity:0.2;fill:#${base07}" d="m 131,602.59961 a 0.88073379,2.3999989 0 0 0 0.88074,2.4 v -2.4 z"/>
         <path id="itemview-focused-topright" style="opacity:0.2;fill:#${base07}" d="m 178.11927,556.99973 c 0.48641,0 0.88073,1.0745 0.88073,2.4 v 1.2 h -0.88073 v -1.2 z"/>
         <g id="slidercursor-normal" transform="matrix(1.2,0,0,1.2,606.8,-14.800244)">
          <rect style="opacity:0.00100002;fill-opacity:0.00392157" width="24" height="24" x="14" y="42" transform="matrix(0.83333333,0,0,0.83333333,-5.6666667,-6)"/>
          <circle style="fill:#${base01}" cx="14" cy="40" r="4" transform="matrix(2.0833333,0,0,2.0833333,-13.166666,-44.333332)"/>
          <circle style="fill:#${base02}" cx="14" cy="40" r="4" transform="matrix(1.875,0,0,1.875,-10.25,-36)"/>
         </g>
         <g id="dial-handle" transform="matrix(1.2,0,0,1.2,527.8,412.19976)">
          <rect style="opacity:0.00100002;fill-opacity:0.00392157" width="24" height="24" x="14" y="42" transform="matrix(0.83333333,0,0,0.83333333,-5.6666667,-6)"/>
          <circle style="fill:#${base01}" cx="14" cy="40" r="4" transform="matrix(2.0833333,0,0,2.0833333,-13.166666,-44.333332)"/>
          <circle style="fill:#${base02}" cx="14" cy="40" r="4" transform="matrix(1.875,0,0,1.875,-10.25,-36)"/>
         </g>
         <g id="tbutton-normal-topleft" style="opacity:0.00100002" transform="matrix(0.44036669,0,0,1.2307681,328.40992,-324.52585)">
          <path style="fill:#${base01}" transform="scale(-1)" d="m 723.0562,-779.58405 a 11.354174,4.0625038 0 0 1 -11.35417,4.06251 v -4.06251 z"/>
          <path style="fill:#${base02}" transform="scale(-1)" d="m 719.64995,-779.58405 a 7.9479218,2.8437526 0 0 1 -7.94792,2.84376 v -2.84376 z"/>
         </g>
         <g id="tbutton-normal-bottomleft" style="opacity:0.00100002" transform="matrix(0.44036669,0,0,1.2307681,335.12006,-316.37576)">
          <path style="fill:#${base01}" transform="rotate(90)" d="m 811.99335,726.93976 a 4.0625038,11.354175 0 0 1 -4.0625,11.35417 v -11.35417 z"/>
          <path style="fill:#${base02}" transform="rotate(90)" d="m 810.7746,726.93964 a 2.8437526,7.9479218 0 0 1 -2.84375,7.94792 v -7.94792 z"/>
         </g>
         <g id="tbutton-normal-left" style="opacity:0.00100002" transform="matrix(0.44036669,0,0,2.0512769,331.97913,-984.73254)">
          <rect style="fill:#${base01}" width="11.354" height="21" x="-731.16" y="789.6"/>
          <rect style="fill:#${base02}" width="7.948" height="21" x="-727.75" y="789.6"/>
         </g>
         <g id="tbutton-normal-top" style="opacity:0.00100002" transform="matrix(0.84070004,0,0,1.2307681,620.14199,-324.56424)">
          <rect style="fill:#${base01}" width="55" height="4.063" x="-719.81" y="775.52"/>
          <rect style="fill:#${base02}" width="55" height="2.844" x="-719.81" y="776.74"/>
         </g>
         <g id="tbutton-normal-bottom" style="opacity:0.00100002" transform="matrix(0.84070004,0,0,1.2307681,620.14199,-319.64118)">
          <rect style="fill:#${base01}" width="55" height="4.063" x="-719.81" y="810.58"/>
          <rect style="fill:#${base02}" width="55" height="2.844" x="-719.81" y="810.58"/>
         </g>
         <g id="tbutton-normal-topright" transform="translate(0,-0.0289917)">
          <path style="opacity:0.00100002;fill:#${base01}" d="m 66.238478,634.95195 a 5,5 0 0 0 -5,-5 v 5 z"/>
          <path style="opacity:0.00100002;fill:#${base02}" d="m 64.738478,634.95195 a 3.5000001,3.5 0 0 0 -3.5,-3.5 v 3.5 z"/>
         </g>
         <g id="tbutton-normal-bottomright" style="opacity:0.00100002" transform="matrix(0.44036669,0,0,1.273756,353.99745,-354.48643)">
          <path style="fill:#${base01}" d="m -653.45302,810.58392 a 11.354174,3.9253986 0 0 1 -11.35417,3.9254 v -3.9254 z"/>
          <path style="fill:#${base02}" d="m -656.85921,810.58392 a 7.9479218,2.7477789 0 0 1 -7.94792,2.74778 v -2.74778 z"/>
         </g>
         <g id="tbutton-normal-right" style="opacity:0.00100002" transform="matrix(0.30924086,0,0,2.0512769,267.3238,-984.73254)">
          <rect style="fill:#${base01}" width="16.169" height="21" x="-666.42" y="789.58"/>
          <rect style="fill:#${base02}" width="11.318" height="21" x="-666.42" y="789.58"/>
         </g>
         <rect id="tbutton-normal" style="opacity:0.00100002;fill:#${base02}" width="46.239" height="43.077" x="15" y="634.92"/>
         <g id="tbutton-toggled-topleft" transform="matrix(0.44036669,0,0,1.2307681,555.40993,-324.52584)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.81250075,-1261.2442,263.65393)" d="m 242,629.99023 a 5,5.0000001 0 0 0 -5,5 h 1.5 3.5 v -3.5 z"/>
         </g>
         <g id="tbutton-toggled-bottomleft" transform="matrix(0.44036669,0,0,1.2307681,562.12006,-316.37576)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.81250075,-1276.4818,257.03199)" d="m 237,678.0293 a 5.0000005,5.0000001 0 0 0 5,5 v -1.46289 -3.5 -0.0371 z"/>
         </g>
         <g id="tbutton-toggled-left" transform="matrix(0.44036669,0,0,2.0512769,558.97914,-984.73264)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.48750122,-1269.3493,480.04423)" d="m 237,634.98438 v 43.07617 h 1.5 v 0.01 h 3.5 v -0.01 -43.06836 -0.008 z"/>
         </g>
         <g id="tbutton-toggled-top" transform="matrix(0.84070003,0,0,1.2307681,847.14198,-324.56423)">
          <path style="fill:#${base07}" transform="matrix(1.1894849,0,0,0.81250075,-1007.6626,263.68512)" d="m 241.99805,629.94922 v 1.50195 3.5 h 46.23828 v -3.5 -1.50195 z"/>
         </g>
         <g id="tbutton-toggled-bottom" transform="matrix(0.84070003,0,0,1.2307681,847.14198,-319.64117)">
          <path style="fill:#${base07}" transform="matrix(1.1894849,0,0,0.81250075,-1007.6626,259.68513)" d="m 241.99805,678.02344 v 3.5 1.50195 h 46.23828 v -1.50195 -3.5 z"/>
         </g>
         <g id="tbutton-toggled-topright" transform="matrix(2.3414816,0,0,5,1844.8721,-3262.9974)">
          <path style="fill:#${base07}" transform="matrix(0.42708002,0,0,0.2,-787.90801,652.59368)" d="m 288.23828,629.95117 v 1.5 3.5 h 3.5 1.5 a 5,5 0 0 0 -5,-5 z"/>
         </g>
         <g id="tbutton-toggled-bottomright" transform="matrix(0.44036669,0,0,1.273756,580.99744,-354.48642)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.78507972,-1319.3492,278.27734)" d="m 288.23828,678.0293 v 3.5 1.5 a 5,5 0 0 0 5,-5 h -1.5 z"/>
         </g>
         <g id="tbutton-toggled-right" transform="matrix(0.30924086,0,0,2.0512769,494.3238,-984.73264)">
          <path style="fill:#${base07}" transform="matrix(3.2337253,0,0,0.48750122,-1598.5074,480.04423)" d="m 288.24023,634.94336 v 0.0117 h -0.002 v 43.07617 h 3.5 v -0.0117 h 1.50195 v -43.07617 z"/>
         </g>
         <rect id="tbutton-toggled" style="fill:#${base07}" width="46.238" height="43.077" x="242" y="634.92"/>
         <rect id="tbutton-focused" style="fill:#${base03}" width="46.239" height="43.077" x="95" y="634.92"/>
         <rect id="tbutton-pressed" style="fill:#${base07}" width="46.239" height="43.077" x="168" y="634.92"/>
         <g id="tbutton-focused-top" transform="matrix(0.84070004,0,0,1.2307681,700.14203,-324.56417)">
          <rect style="opacity:0.3" width="55" height="4.063" x="-719.81" y="775.52"/>
          <rect style="fill:#${base03}" width="55" height="2.844" x="-719.81" y="776.74"/>
         </g>
         <g id="tbutton-focused-topright" transform="translate(0,-0.0289917)">
          <path style="opacity:0.3" d="m 146.23858,634.95205 a 5,5 0 0 0 -5,-5 v 5 z"/>
          <path style="fill:#${base03}" d="m 144.73858,634.95205 a 3.5000001,3.5 0 0 0 -3.5,-3.5 v 3.5 z"/>
         </g>
         <g id="tbutton-focused-topleft" transform="matrix(0.44036669,0,0,1.2307681,408.40995,-324.56424)">
          <path style="opacity:0.3" transform="scale(-1)" d="m 723.0562,-779.58405 a 11.354174,4.0625038 0 0 1 -11.35417,4.06251 v -4.06251 z"/>
          <path style="fill:#${base03}" transform="scale(-1)" d="m 719.64995,-779.58405 a 7.9479218,2.8437526 0 0 1 -7.94792,2.84376 v -2.84376 z"/>
         </g>
         <g id="tbutton-focused-left" transform="matrix(0.44036669,0,0,2.0512769,411.97915,-984.77094)">
          <rect style="opacity:0.3" width="11.354" height="21" x="-731.16" y="789.6"/>
          <rect style="fill:#${base03}" width="7.948" height="21" x="-727.75" y="789.6"/>
         </g>
         <g id="tbutton-focused-bottomleft" transform="matrix(0.44036669,0,0,1.2307681,415.12006,-316.37576)">
          <path style="opacity:0.3" transform="rotate(90)" d="m 811.99335,726.93976 a 4.0625038,11.354175 0 0 1 -4.0625,11.35417 v -11.35417 z"/>
          <path style="fill:#${base03}" transform="rotate(90)" d="m 810.7746,726.93964 a 2.8437526,7.9479218 0 0 1 -2.84375,7.94792 v -7.94792 z"/>
         </g>
         <g id="tbutton-focused-bottom" transform="matrix(0.84070004,0,0,1.2307681,700.14203,-319.64116)">
          <rect style="opacity:0.3" width="55" height="4.063" x="-719.81" y="810.58"/>
          <rect style="fill:#${base03}" width="55" height="2.844" x="-719.81" y="810.58"/>
         </g>
         <g id="tbutton-focused-bottomright" transform="matrix(0.44036669,0,0,1.273756,433.9975,-354.48639)">
          <path style="opacity:0.3" d="m -653.45302,810.58392 a 11.354174,3.9253986 0 0 1 -11.35417,3.9254 v -3.9254 z"/>
          <path style="fill:#${base03}" d="m -656.85921,810.58392 a 7.9479218,2.7477789 0 0 1 -7.94792,2.74778 v -2.74778 z"/>
         </g>
         <g id="tbutton-focused-right" transform="matrix(0.30924086,0,0,2.0512769,347.32386,-984.73244)">
          <rect style="opacity:0.3" width="16.169" height="21" x="-666.42" y="789.58"/>
          <rect style="fill:#${base03}" width="11.318" height="21" x="-666.42" y="789.58"/>
         </g>
         <g id="tbutton-pressed-topleft" transform="matrix(0.44036669,0,0,1.2307681,481.40997,-324.52587)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.81250075,-1093.2025,263.65396)" d="m 168,629.99023 a 5,5.0000001 0 0 0 -5,5 h 1.5 3.5 v -3.5 z"/>
         </g>
         <g id="tbutton-pressed-top" transform="matrix(0.84070004,0,0,1.2307681,773.14197,-324.56417)">
          <path style="fill:#${base07}" transform="matrix(1.1894849,0,0,0.81250075,-919.6407,263.68508)" d="m 167.99805,629.94922 v 1.50195 3.5 h 46.23828 v -3.5 -1.50195 z"/>
         </g>
         <g id="tbutton-pressed-topright" transform="matrix(2.3414816,0,0,5,1770.872,-3262.9973)">
          <path style="fill:#${base07}" transform="matrix(0.42708002,0,0,0.2,-756.30404,652.59366)" d="m 214.23828,629.95117 v 1.5 3.5 h 3.5 1.5 a 5,5 0 0 0 -5,-5 z"/>
         </g>
         <g id="tbutton-pressed-left" transform="matrix(0.44036669,0,0,2.0512769,484.97914,-984.77104)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.48750122,-1101.3075,480.06295)" d="m 163,634.94531 v 43.07813 H 164.50195 168 168.002 V 634.94531 H 168 164.50195 Z"/>
         </g>
         <g id="tbutton-pressed-right" transform="matrix(0.30924086,0,0,2.0512769,420.32385,-984.73244)">
          <path style="fill:#${base07}" transform="matrix(3.2337253,0,0,0.48750122,-1359.2119,480.04414)" d="m 214.24023,634.94336 v 43.07812 h 3.5 1.5 v -43.07812 h -1.5 z"/>
         </g>
         <g id="tbutton-pressed-bottomright" transform="matrix(0.44036669,0,0,1.273756,506.99751,-354.48638)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.78507972,-1151.3076,278.27731)" d="m 214.23828,678.0293 v 3.5 1.5 a 5,5 0 0 0 5,-5 h -1.5 z"/>
         </g>
         <g id="tbutton-pressed-bottom" transform="matrix(0.84070004,0,0,1.2307681,773.14207,-319.64117)">
          <path style="fill:#${base07}" transform="matrix(1.1894849,0,0,0.81250075,-919.64082,259.68513)" d="m 167.99805,678.02344 v 3.5 1.50195 h 46.23828 v -1.50195 -3.5 z"/>
         </g>
         <g id="tbutton-pressed-bottomleft" transform="matrix(0.44036669,0,0,1.2307681,488.12006,-316.37577)">
          <path style="fill:#${base07}" transform="matrix(2.2708348,0,0,0.81250075,-1108.44,257.03199)" d="m 163,678.0293 a 5.0000005,5.0000001 0 0 0 5,5 v -1.5 -3.5 h -3.5 z"/>
         </g>
         <g id="common-normal-top" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" transform="scale(1,-1)" d="m 610.00043,-369.02874 h 40 v 1.00005 h -40 z"/>
         </g>
         <rect id="common-normal" style="opacity:0.00100002" width="40" height="40" x="659" y="-410" transform="scale(1,-1)"/>
         <g id="common-normal-topleft" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" d="m 609,368.0314 c -1.10167,0 -0.99736,-0.10427 -0.99736,0.99736 H 609 Z"/>
         </g>
         <g id="common-normal-topright" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" d="m 650.99998,368.03139 c 1.10161,0 0.99736,-0.10427 0.99736,0.99736 h -0.99736 z"/>
         </g>
         <g id="common-normal-left" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" transform="matrix(0,-1,-1,0,0,0)" d="m -410.02869,-608.99998 h 40 V -608 h -40 z"/>
         </g>
         <g id="common-normal-right" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" transform="matrix(0,1,1,0,0,0)" d="m 370.02878,651.00002 h 40 v 1.00004 h -40 z"/>
         </g>
         <g id="common-normal-bottom" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" d="m 610.00043,411.02889 h 40 v 0.99986 h -40 z"/>
         </g>
         <g id="common-normal-bottomleft" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" d="m 609,412.02609 c -1.10167,0 -0.99736,0.10447 -0.99736,-0.99735 H 609 Z"/>
         </g>
         <g id="common-normal-bottomright" transform="translate(49,-0.0289917)">
          <path style="fill:#${base02}" d="m 650.99998,412.02609 c 1.10161,0 0.99736,0.10447 0.99736,-0.99735 h -0.99736 z"/>
         </g>
         <g id="group-normal-top" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" transform="scale(1,-1)" d="m 610.00043,-369.02874 h 40 v 1.00005 h -40 z"/>
         </g>
         <rect id="group-normal" style="opacity:0.00100002" width="40" height="40" x="708" y="-410" transform="scale(1,-1)"/>
         <g id="group-normal-topleft" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" d="m 609,368.0314 c -1.10167,0 -0.99736,-0.10427 -0.99736,0.99736 H 609 Z"/>
         </g>
         <g id="group-normal-topright" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" d="m 650.99998,368.03139 c 1.10161,0 0.99736,-0.10427 0.99736,0.99736 h -0.99736 z"/>
         </g>
         <g id="group-normal-left" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" transform="matrix(0,-1,-1,0,0,0)" d="m -410.02869,-608.99998 h 40 V -608 h -40 z"/>
         </g>
         <g id="group-normal-right" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" transform="matrix(0,1,1,0,0,0)" d="m 370.02878,651.00002 h 40 v 1.00004 h -40 z"/>
         </g>
         <g id="group-normal-bottom" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" d="m 610.00043,411.02889 h 40 v 0.99986 h -40 z"/>
         </g>
         <g id="group-normal-bottomleft" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" d="m 609,412.02609 c -1.10167,0 -0.99736,0.10447 -0.99736,-0.99735 H 609 Z"/>
         </g>
         <g id="group-normal-bottomright" transform="translate(98,-0.0289917)">
          <path style="fill:#${base02}" d="m 650.99998,412.02609 c 1.10161,0 0.99736,0.10447 0.99736,-0.99735 h -0.99736 z"/>
         </g>
         <g id="header-focused-top" transform="translate(-186,142.97101)">
          <path style="opacity:0.3" transform="scale(1,-1)" d="m 610.00043,-369.02874 h 40 v 1.00005 h -40 z"/>
         </g>
         <rect id="header-focused" style="fill:#${base01}" width="40" height="40" x="424" y="-553" transform="scale(1,-1)"/>
         <g id="header-focused-topleft" transform="translate(-186,142.97101)">
          <path style="opacity:0.3" d="m 609,368.0314 c -1.10167,0 -0.99736,-0.10427 -0.99736,0.99736 H 609 Z"/>
         </g>
         <g id="header-focused-topright" transform="translate(-186,142.97101)">
          <path style="opacity:0.3" d="m 650.99998,368.03139 c 1.10161,0 0.99736,-0.10427 0.99736,0.99736 h -0.99736 z"/>
         </g>
         <g id="header-focused-left" transform="translate(-186,142.97101)">
          <path style="opacity:0.00100002" transform="matrix(0,-1,-1,0,0,0)" d="m -410.02869,-608.99998 h 40 V -608 h -40 z"/>
         </g>
         <g id="header-focused-right" transform="translate(-186,142.97101)">
          <path style="opacity:0.00100002" transform="matrix(0,1,1,0,0,0)" d="m 370.02878,651.00002 h 40 v 1.00004 h -40 z"/>
         </g>
         <g id="header-focused-bottom" transform="translate(-186,142.97101)">
          <path style="opacity:0.3" d="m 610.00043,411.02889 h 40 v 0.99986 h -40 z"/>
         </g>
         <g id="header-focused-bottomleft" transform="translate(-186,142.97101)">
          <path style="opacity:0.3" d="m 609,412.02609 c -1.10167,0 -0.99736,0.10447 -0.99736,-0.99735 H 609 Z"/>
         </g>
         <g id="header-focused-bottomright" transform="translate(-186,142.97101)">
          <path style="opacity:0.3" d="m 650.99998,412.02609 c 1.10161,0 0.99736,0.10447 0.99736,-0.99735 h -0.99736 z"/>
         </g>
         <g id="header-normal-top" transform="translate(-139,142.97101)">
          <path style="opacity:0.3" transform="scale(1,-1)" d="m 610.00043,-369.02874 h 40 v 1.00005 h -40 z"/>
         </g>
         <rect id="header-normal" style="fill:#${base01}" width="40" height="40" x="471" y="-553" transform="scale(1,-1)"/>
         <g id="header-normal-topleft" transform="translate(-139,142.97101)">
          <path style="opacity:0.3" d="m 609,368.0314 c -1.10167,0 -0.99736,-0.10427 -0.99736,0.99736 H 609 Z"/>
         </g>
         <g id="header-normal-topright" transform="translate(-139,142.97101)">
          <path style="opacity:0.3" d="m 650.99998,368.03139 c 1.10161,0 0.99736,-0.10427 0.99736,0.99736 h -0.99736 z"/>
         </g>
         <g id="header-normal-left" transform="translate(-139,142.97101)">
          <path style="opacity:0.00100002" transform="matrix(0,-1,-1,0,0,0)" d="m -410.02869,-608.99998 h 40 V -608 h -40 z"/>
         </g>
         <g id="header-normal-right" transform="translate(-139,142.97101)">
          <path style="opacity:0.00100002" transform="matrix(0,1,1,0,0,0)" d="m 370.02878,651.00002 h 40 v 1.00004 h -40 z"/>
         </g>
         <g id="header-normal-bottom" transform="translate(-139,142.97101)">
          <path style="opacity:0.3" d="m 610.00043,411.02889 h 40 v 0.99986 h -40 z"/>
         </g>
         <g id="header-normal-bottomleft" transform="translate(-139,142.97101)">
          <path style="opacity:0.3" d="m 609,412.02609 c -1.10167,0 -0.99736,0.10447 -0.99736,-0.99735 H 609 Z"/>
         </g>
         <g id="header-normal-bottomright" transform="translate(-139,142.97101)">
          <path style="opacity:0.3" d="m 650.99998,412.02609 c 1.10161,0 0.99736,0.10447 0.99736,-0.99735 h -0.99736 z"/>
         </g>
         <rect id="progress-pattern-disabled" style="opacity:0.00100002;fill:#${base07}" width="20" height="20" x="455" y="23"/>
         <g id="header-separator" transform="translate(-26,-19.028994)">
          <rect id="header-separator0" style="fill-opacity:0" width="2" height="36" x="608" y="533.03"/>
          <path style="opacity:0.3" d="m 608,533.02875 h 0.98586 v 36 H 608 Z"/>
         </g>
         <g id="toolbar-handle" transform="matrix(2.4000001,0,0,1,-869.0001,-19.028994)">
          <rect style="fill-opacity:0" width="2" height="36" x="608" y="533.03"/>
          <path style="opacity:0.3" d="M 607.91667,533.02875 H 607.5 v 36 h 0.41667 z"/>
         </g>
         <g id="tab-close-normal" transform="translate(438,-745.00024)">
          <rect style="opacity:0.00100002" width="10" height="10" x="269" y="953"/>
          <g style="enable-background:new" transform="translate(266,950.00697)">
           <g transform="translate(-265,-121)">
            <path style="fill:#${base05}" d="m 270,125 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.293,2.293 -2.293,2.293 a 1,1 0 0 0 -0.29,0.7 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.293,-2.293 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30273 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.3,-2.3 2.2832,-2.2832 a 1,1 0 0 0 0.31,-0.72 1,1 0 0 0 -1,-1 1,1 0 0 0 -0.70703,0.29297 l -2.293,2.293 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.7,-0.29 z"/>
           </g>
          </g>
         </g>
         <g id="tab-close-focused" transform="translate(450,-745.00024)">
          <rect style="opacity:0.00100002" width="10" height="10" x="269" y="953"/>
          <g style="enable-background:new" transform="translate(266,950.00697)">
           <g transform="translate(-265,-121)">
            <path style="fill:#${base08}" d="m 270,125 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.293,2.293 -2.293,2.293 a 1,1 0 0 0 -0.29,0.7 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.293,-2.293 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30273 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.3,-2.3 2.2832,-2.2832 a 1,1 0 0 0 0.31,-0.72 1,1 0 0 0 -1,-1 1,1 0 0 0 -0.70703,0.29297 l -2.293,2.293 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.7,-0.29 z"/>
           </g>
          </g>
         </g>
         <g id="tab-close-pressed" transform="translate(462,-745.00024)">
          <rect style="opacity:0.00100002" width="10" height="10" x="269" y="953"/>
          <g style="enable-background:new" transform="translate(266,950.00697)">
           <g transform="translate(-265,-121)">
            <path style="fill:#${base07}" d="m 270,125 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.293,2.293 -2.293,2.293 a 1,1 0 0 0 -0.29,0.7 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.293,-2.293 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30273 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.3,-2.3 2.2832,-2.2832 a 1,1 0 0 0 0.31,-0.72 1,1 0 0 0 -1,-1 1,1 0 0 0 -0.70703,0.29297 l -2.293,2.293 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.7,-0.29 z"/>
           </g>
          </g>
         </g>
         <g id="tab-close-disabled" transform="translate(474,-745.00024)">
          <rect style="opacity:0.00100002" width="10" height="10" x="269" y="953"/>
          <g style="enable-background:new" transform="translate(266,950.00697)">
           <g transform="translate(-265,-121)">
            <path style="opacity:0.00100002" d="m 270,125 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.293,2.293 -2.293,2.293 a 1,1 0 0 0 -0.29,0.7 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.293,-2.293 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30273 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.3,-2.3 2.2832,-2.2832 a 1,1 0 0 0 0.31,-0.72 1,1 0 0 0 -1,-1 1,1 0 0 0 -0.70703,0.29297 l -2.293,2.293 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.7,-0.29 z"/>
           </g>
          </g>
         </g>
         <g id="mdi-close-normal" transform="translate(0,-0.0289917)">
          <rect style="opacity:0.00100002" width="16" height="16" x="54" y="428.03"/>
          <path style="fill:#${base05}" d="m 65.002415,432.02406 a 1,1 0 0 0 -0.70703,0.29297 l -2.29297,2.29297 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.70117,-0.28906 l -0.01,0.0137 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.29297,2.29297 -2.29297,2.29297 a 1,1 0 0 0 -0.28906,0.69922 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.29297,-2.29297 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30274 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.30078,-2.29883 2.2832,-2.2832 a 1,1 0 0 0 0.31055,-0.72071 1,1 0 0 0 -1,-1 z"/>
         </g>
         <g id="mdi-minimize-normal" transform="translate(0,-0.0289917)">
          <rect style="opacity:0.00100002" width="16" height="16" x="72" y="428.03"/>
          <rect style="fill:#${base05}" width="8" height="2" x="76" y="435.03" rx="1" ry="1"/>
         </g>
         <g id="mdi-maximize-normal" transform="translate(0,-0.0289917)">
          <rect style="opacity:0.00100002" width="16" height="16" x="90" y="428.03"/>
          <path style="fill:#${base05}" d="m 98,432.0293 c -0.554,0 -1,0.446 -1,1 v 2 h -2 c -0.554,0 -1,0.446 -1,1 0,0.554 0.446,1 1,1 h 2 v 2 c 0,0.554 0.446,1 1,1 0.554,0 1,-0.446 1,-1 v -2 h 2 c 0.554,0 1,-0.446 1,-1 0,-0.554 -0.446,-1 -1,-1 h -2 v -2 c 0,-0.554 -0.446,-1 -1,-1 z"/>
         </g>
         <g id="mdi-restore-normal" transform="translate(0,-0.0289917)">
          <rect style="opacity:0.00100002" width="16" height="16" x="108" y="428.03"/>
          <path style="fill:#${base05}" d="m 116,432.0293 a 4,4 0 0 0 -4,4 4,4 0 0 0 4,4 4,4 0 0 0 4,-4 4,4 0 0 0 -4,-4 z m 0,2 a 2,2 0 0 1 2,2 2,2 0 0 1 -2,2 2,2 0 0 1 -2,-2 2,2 0 0 1 2,-2 z"/>
         </g>
         <g id="mdi-close-focused" transform="translate(0,16.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="54" y="428.03"/>
          <path style="fill:#${base08}" d="m 65.002415,432.02406 a 1,1 0 0 0 -0.70703,0.29297 l -2.29297,2.29297 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.70117,-0.28906 l -0.01,0.0137 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.29297,2.29297 -2.29297,2.29297 a 1,1 0 0 0 -0.28906,0.69922 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.29297,-2.29297 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30274 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.30078,-2.29883 2.2832,-2.2832 a 1,1 0 0 0 0.31055,-0.72071 1,1 0 0 0 -1,-1 z"/>
         </g>
         <g id="mdi-minimize-focused" transform="translate(0,16.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="72" y="428.03"/>
          <rect style="fill:#${base08}" width="8" height="2" x="76" y="435.03" rx="1" ry="1"/>
         </g>
         <g id="mdi-maximize-focused" transform="translate(0,16.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="90" y="428.03"/>
          <path style="fill:#${base08}" d="m 98,432.0293 c -0.554,0 -1,0.446 -1,1 v 2 h -2 c -0.554,0 -1,0.446 -1,1 0,0.554 0.446,1 1,1 h 2 v 2 c 0,0.554 0.446,1 1,1 0.554,0 1,-0.446 1,-1 v -2 h 2 c 0.554,0 1,-0.446 1,-1 0,-0.554 -0.446,-1 -1,-1 h -2 v -2 c 0,-0.554 -0.446,-1 -1,-1 z"/>
         </g>
         <g id="mdi-restore-focused" transform="translate(0,16.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="108" y="428.03"/>
          <path style="fill:#${base08}" d="m 116,432.0293 a 4,4 0 0 0 -4,4 4,4 0 0 0 4,4 4,4 0 0 0 4,-4 4,4 0 0 0 -4,-4 z m 0,2 a 2,2 0 0 1 2,2 2,2 0 0 1 -2,2 2,2 0 0 1 -2,-2 2,2 0 0 1 2,-2 z"/>
         </g>
         <g id="mdi-close-pressed" transform="translate(0,33.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="54" y="428.03"/>
          <path style="fill:#${base07}" d="m 65.002415,432.02406 a 1,1 0 0 0 -0.70703,0.29297 l -2.29297,2.29297 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.70117,-0.28906 l -0.01,0.0137 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.29297,2.29297 -2.29297,2.29297 a 1,1 0 0 0 -0.28906,0.69922 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.29297,-2.29297 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30274 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.30078,-2.29883 2.2832,-2.2832 a 1,1 0 0 0 0.31055,-0.72071 1,1 0 0 0 -1,-1 z"/>
         </g>
         <g id="mdi-minimize-pressed" transform="translate(0,33.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="72" y="428.03"/>
          <rect style="fill:#${base07}" width="8" height="2" x="76" y="435.03" rx="1" ry="1"/>
         </g>
         <g id="mdi-maximize-pressed" transform="translate(0,33.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="90" y="428.03"/>
          <path style="fill:#${base07}" d="m 98,432.0293 c -0.554,0 -1,0.446 -1,1 v 2 h -2 c -0.554,0 -1,0.446 -1,1 0,0.554 0.446,1 1,1 h 2 v 2 c 0,0.554 0.446,1 1,1 0.554,0 1,-0.446 1,-1 v -2 h 2 c 0.554,0 1,-0.446 1,-1 0,-0.554 -0.446,-1 -1,-1 h -2 v -2 c 0,-0.554 -0.446,-1 -1,-1 z"/>
         </g>
         <g id="mdi-restore-pressed" transform="translate(0,33.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="108" y="428.03"/>
          <path style="fill:#${base07}" d="m 116,432.0293 a 4,4 0 0 0 -4,4 4,4 0 0 0 4,4 4,4 0 0 0 4,-4 4,4 0 0 0 -4,-4 z m 0,2 a 2,2 0 0 1 2,2 2,2 0 0 1 -2,2 2,2 0 0 1 -2,-2 2,2 0 0 1 2,-2 z"/>
         </g>
         <g id="mdi-close-disabled" transform="translate(0,50.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="54" y="428.03"/>
          <path style="opacity:0.3;fill:#${base05}" d="m 65.002415,432.02406 a 1,1 0 0 0 -0.70703,0.29297 l -2.29297,2.29297 -2.2832,-2.2832 a 1,1 0 0 0 -0.01,-0.01 1,1 0 0 0 -0.70117,-0.28906 l -0.01,0.0137 a 1,1 0 0 0 -1,1 1,1 0 0 0 0.29297,0.70703 l 2.29297,2.29297 -2.29297,2.29297 a 1,1 0 0 0 -0.28906,0.69922 1,1 0 0 0 1,1 1,1 0 0 0 0.70703,-0.29297 l 2.29297,-2.29297 2.2832,2.2832 a 1,1 0 0 0 0.7168,0.30274 1,1 0 0 0 1,-1 1,1 0 0 0 -0.29297,-0.70703 l -2.30078,-2.29883 2.2832,-2.2832 a 1,1 0 0 0 0.31055,-0.72071 1,1 0 0 0 -1,-1 z"/>
         </g>
         <g id="mdi-minimize-disabled" transform="translate(0,50.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="72" y="428.03"/>
          <rect style="opacity:0.3;fill:#${base05}" width="8" height="2" x="76" y="435.03" rx="1" ry="1"/>
         </g>
         <g id="mdi-maximize-disabled" transform="translate(0,50.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="90" y="428.03"/>
          <path style="opacity:0.3;fill:#${base05}" d="m 98,432.0293 c -0.554,0 -1,0.446 -1,1 v 2 h -2 c -0.554,0 -1,0.446 -1,1 0,0.554 0.446,1 1,1 h 2 v 2 c 0,0.554 0.446,1 1,1 0.554,0 1,-0.446 1,-1 v -2 h 2 c 0.554,0 1,-0.446 1,-1 0,-0.554 -0.446,-1 -1,-1 h -2 v -2 c 0,-0.554 -0.446,-1 -1,-1 z"/>
         </g>
         <g id="mdi-restore-disabled" transform="translate(0,50.971008)">
          <rect style="opacity:0.00100002" width="16" height="16" x="108" y="428.03"/>
          <path style="opacity:0.3;fill:#${base05}" d="m 116,432.0293 a 4,4 0 0 0 -4,4 4,4 0 0 0 4,4 4,4 0 0 0 4,-4 4,4 0 0 0 -4,-4 z m 0,2 a 2,2 0 0 1 2,2 2,2 0 0 1 -2,2 2,2 0 0 1 -2,-2 2,2 0 0 1 2,-2 z"/>
         </g>
         <g id="mdi-menu-normal" transform="translate(0,-0.0289917)">
          <rect style="opacity:0.00100002" width="16" height="16" x="135" y="428.03"/>
          <path style="fill:#${base05}" d="m 140,432.0293 c -0.554,0 -1,0.446 -1,1 0,0.554 0.446,1 1,1 h 6 c 0.554,0 1,-0.446 1,-1 0,-0.554 -0.446,-1 -1,-1 z m 0,3 c -0.554,0 -1,0.446 -1,1 0,0.554 0.446,1 1,1 h 6 c 0.554,0 1,-0.446 1,-1 0,-0.554 -0.446,-1 -1,-1 z m 0,3 c -0.554,0 -1,0.446 -1,1 0,0.554 0.446,1 1,1 h 6 c 0.554,0 1,-0.446 1,-1 0,-0.554 -0.446,-1 -1,-1 z"/>
         </g>
         <g id="focus-top" transform="translate(215.99999,-20.500249)">
          <path id="focus-top0" style="fill-opacity:0" d="m 90,109.5 h 20 v -2 H 90 Z"/>
          <g style="fill-opacity:0.137">
           <path style="opacity:0.3;fill:#${base05}" d="m 90,109.5 h 2.5 v -2 H 90 Z"/>
           <path style="opacity:0.3;fill:#${base05}" d="m 95,109.5 h 2.5 v -2 H 95 Z"/>
           <path style="opacity:0.3;fill:#${base05}" d="m 99.75,109.5 h 2.5 v -2 h -2.5 z"/>
           <path style="opacity:0.3;fill:#${base05}" d="m 105,109.5 h 2.5 v -2 H 105 Z"/>
          </g>
         </g>
         <use id="focus-right" width="100%" height="100%" x="0" y="0" transform="rotate(90,316.00001,98.999761)" xlink:href="#focus-top"/>
         <use id="focus-bottom" width="100%" height="100%" x="0" y="0" transform="rotate(180,316.00001,98.999751)" xlink:href="#focus-top"/>
         <use id="focus-left" width="100%" height="100%" x="0" y="0" transform="rotate(-90,316,98.999741)" xlink:href="#focus-top"/>
         <g id="toolbar-normal-bottomleft" transform="matrix(4.999997,0,0,1,-55.999946,-0.0289917)">
          <path style="fill:#${base01}" d="m 12.999997,131.02899 4e-6,4.99996 0.999996,2e-5 v -2.49999 -2.49999 h -0.501109 z"/>
          <path style="opacity:0.3" d="m 12.999997,135.02899 4e-6,0.99998 0.999996,1e-5 v -0.5 -0.49999 h -0.501109 z"/>
         </g>
         <g id="toolbar-normal-bottom" transform="translate(0,-0.0289917)">
          <path style="fill:#${base01}" d="m 13.999999,131.02895 v 2.49998 2.49998 h 45.999999 v -2.49998 -2.49998 z"/>
          <path style="opacity:0.3" d="m 13.999999,135.02898 v 0.49999 0.5 h 45.999999 v -0.5 -0.49999 z"/>
         </g>
         <g id="toolbar-normal-bottomright" transform="matrix(5.000004,0,0,1,-240.00022,-0.0289917)">
          <path style="fill:#${base01}" d="m 59.999996,131.02901 v 2.49999 2.49998 c 0.26796,0 1.000004,0 1.000004,0 0,0 -4e-6,-3.57838 -4e-6,-4.99997 h -0.5 z"/>
          <path style="opacity:0.3" d="m 59.999996,135.02899 v 0.5 0.49999 c 0.26796,0 1.000004,0 1.000004,0 0,0 -4e-6,-0.71567 -4e-6,-0.99999 h -0.5 z"/>
         </g>
         <g id="toolbar-normal-topleft" transform="rotate(90,37.014489,108.01449)">
          <path style="fill:#${base01}" d="m 12.999997,131.02899 4e-6,4.99996 0.999996,2e-5 v -2.49999 -2.49999 h -0.501109 z"/>
         </g>
         <g id="toolbar-normal-left" transform="rotate(90,37.014489,108.01449)">
          <path style="fill:#${base01}" d="m 13.999999,131.02895 v 2.49998 2.49998 h 45.999999 v -2.49998 -2.49998 z"/>
         </g>
         <g id="toolbar-normal-topright" transform="matrix(0,1,1,0,-71.02899,71.000003)">
          <path style="fill:#${base01}" d="m 12.999997,131.02899 4e-6,4.99996 0.999996,2e-5 v -2.49999 -2.49999 h -0.501109 z"/>
         </g>
         <g id="toolbar-normal-right" transform="matrix(0,1,1,0,-71.02899,71.000003)">
          <path style="fill:#${base01}" d="m 13.999999,131.02895 v 2.49998 2.49998 h 45.999999 v -2.49998 -2.49998 z"/>
         </g>
         <g id="window-normal-top" transform="matrix(0.83636363,0,0,0.5,1369.0229,-135.79001)">
          <path style="fill:#${base00}" transform="matrix(1.25,0,0,2,-738.56,609.52204)" d="m 15,84.029297 v 0.5 0.5 h 44 v -0.5 -0.5 z"/>
         </g>
         <rect id="window-normal" style="fill:#${base00}" width="46" height="46" x="767" y="254"/>
         <g id="window-normal-bottomleft" transform="matrix(4.999997,0,0,1,697.00006,168.97102)">
          <path style="fill:#${base00}" d="m 12.999997,131.02899 4e-6,4.99996 0.999996,2e-5 v -2.49999 -2.49999 h -0.501109 z"/>
          <path style="fill:#${base02}" d="m 12.999997,135.02899 4e-6,0.99998 0.999996,1e-5 v -0.5 -0.49999 h -0.501109 z"/>
          <path style="fill:#${base02}" d="m 13.199993,131.02897 -0.199996,2e-5 -2e-6,4 h 0.1 0.1 v -1.50557 z"/>
         </g>
         <g id="window-normal-bottom" transform="translate(753.00001,168.97102)">
          <path style="fill:#${base00}" d="m 13.999999,131.02895 v 2.49998 2.49998 h 45.999999 v -2.49998 -2.49998 z"/>
          <path style="fill:#${base02}" d="m 13.999999,135.02898 v 0.49999 0.5 h 45.999999 v -0.5 -0.49999 z"/>
         </g>
         <g id="window-normal-bottomright" transform="matrix(5.000004,0,0,1,512.99979,168.97102)">
          <path style="fill:#${base00}" d="m 59.999996,131.02901 v 2.49999 2.49998 c 0.26796,0 1.000004,0 1.000004,0 0,0 -4e-6,-3.57838 -4e-6,-4.99997 h -0.5 z"/>
          <path style="fill:#${base02}" d="m 59.999996,135.02899 v 0.5 0.49999 c 0.26796,0 1.000004,0 1.000004,0 0,0 -4e-6,-0.71567 -4e-6,-0.99999 h -0.5 z"/>
          <path style="fill:#${base02}" d="m 60.999995,131.02899 h -0.1 -0.1 v 4.00001 l 0.199998,-2e-5 v -1.49999 z"/>
         </g>
         <g id="window-normal-topleft" transform="rotate(90,329.0145,569.01449)">
          <path style="fill:#${base00}" d="m 12.999997,131.02899 4e-6,4.99996 0.999996,2e-5 v -2.49999 -2.49999 h -0.501109 z"/>
          <path style="fill:#${base02}" d="m 12.999997,135.02899 4e-6,0.99998 0.999996,1e-5 v -0.5 -0.49999 h -0.501109 z"/>
         </g>
         <g id="window-normal-left" transform="rotate(90,329.0145,569.01449)">
          <path style="fill:#${base00}" d="m 13.999999,131.02895 v 2.49998 2.49998 h 45.999999 v -2.49998 -2.49998 z"/>
          <path style="fill:#${base02}" d="m 13.999999,135.02898 v 0.49999 0.5 h 45.999999 v -0.5 -0.49999 z"/>
         </g>
         <g id="window-normal-topright" transform="matrix(0,1,1,0,681.97102,240.00001)">
          <path style="fill:#${base00}" d="m 12.999997,131.02899 4e-6,4.99996 0.999996,2e-5 v -2.49999 -2.49999 h -0.501109 z"/>
          <path style="fill:#${base02}" d="m 12.999997,135.02899 4e-6,0.99998 0.999996,1e-5 v -0.5 -0.49999 h -0.501109 z"/>
         </g>
         <g id="window-normal-right" transform="matrix(0,1,1,0,681.97102,240.00001)">
          <path style="fill:#${base00}" d="m 13.999999,131.02895 v 2.49998 2.49998 h 45.999999 v -2.49998 -2.49998 z"/>
          <path style="fill:#${base02}" d="m 13.999999,135.02898 v 0.49999 0.5 h 45.999999 v -0.5 -0.49999 z"/>
         </g>
         <rect id="menubaritem-focused" style="opacity:0.05;fill:#${base05}" width="30" height="10" x="722.48" y="155.14"/>
         <rect id="menubaritem-normal" style="opacity:0.00100002" width="30" height="10" x="680.28" y="155.14"/>
         <rect id="menubaritem-toggled" style="opacity:0.05;fill:#${base05}" width="30" height="10" x="765.88" y="155.14"/>
         <rect id="menubaritem-pressed" style="fill:#${base07}" width="30" height="10" x="803.48" y="155.14"/>
         <g id="button-default-indicator" transform="translate(-363.9397,-69.953611)">
          <rect style="opacity:0;fill:#${base02}" width="25" height="25" x="375" y="87.5"/>
          <path style="opacity:0.00100002" d="m 396.25,86.25 -17.5,17.5 h 17.5 z"/>
         </g>
         <g id="tooltip-normal" transform="matrix(1.4375,0,0,1.34375,568.62497,-2636.5162)">
          <path style="opacity:0.95;fill:#${base02}" d="m 138,2225.5 h 32 v 32 h -32 z"/>
         </g>
         <g id="tooltip-normal-topleft" transform="matrix(0.44036669,0,0,1.2307681,1080.4099,-605.48774)">
          <path style="opacity:0.95;fill:#${base02}" transform="scale(-1)" d="m 721.4667,-779.58405 c 1e-5,1.79493 -4.74801,3.49153 -9.76461,3.49153 v -3.49153 z"/>
          <path style="fill:#${base01}" transform="matrix(2.2708348,0,0,0.81250075,-2453.4324,491.93543)" d="m 767,349.0293 a 4.9999999,5.0000001 0 0 0 -5,5 h 1 a 3.9999998,4.0000001 0 0 1 4,-4 z"/>
         </g>
         <g id="tooltip-normal-top" transform="matrix(0.83636364,0,0,1.2307681,1369.0206,-605.48767)">
          <path style="opacity:0.95;fill:#${base02}" d="m -719.81,776.0884 h 55 v 3.49162 h -55 z"/>
          <path style="fill:#${base01}" transform="matrix(1.1956522,0,0,0.81250075,-1636.8724,491.93537)" d="m 767,349.0293 v 1 h 46 v -1 z"/>
         </g>
         <g id="tooltip-normal-left" transform="matrix(0.44036669,0,0,2.0476103,1083.9791,-1262.7992)">
          <path style="opacity:0.95;fill:#${base02}" d="m -729.57176,789.59998 h 9.76475 v 21 h -9.76475 z"/>
          <path style="fill:#${base01}" transform="matrix(2.2708348,0,0,0.48837418,-2461.5375,616.70421)" d="m 762,354.0293 v 43 h 1 v -43 z"/>
         </g>
         <g id="tooltip-normal-topright" transform="matrix(-0.44036669,0,0,1.2307681,499.59011,-605.48774)">
          <path style="opacity:0.95;fill:#${base02}" transform="scale(-1)" d="m 721.4666,-779.58405 c 10e-6,1.79493 -4.74797,3.49153 -9.76457,3.49153 v -3.49153 z"/>
          <path style="fill:#${base01}" transform="matrix(-2.2708348,0,0,0.81250075,1134.4867,491.93543)" d="m 813,349.0293 v 1 a 3.9999998,4.0000001 0 0 1 4,4 h 1 a 4.9999999,5.0000001 0 0 0 -5,-5 z"/>
         </g>
         <g id="tooltip-normal-right" transform="matrix(-0.44036669,0,0,2.0476103,496.02091,-1262.7992)">
          <path style="opacity:0.95;fill:#${base02}" d="m -729.57166,789.59998 h 9.76465 v 21 h -9.76465 z"/>
          <path style="fill:#${base01}" transform="matrix(-2.2708348,0,0,0.48837418,1126.3816,616.70421)" d="m 817,354.0293 v 43 h 1 v -43 z"/>
         </g>
         <g id="tooltip-normal-bottomleft" transform="matrix(0.44036669,0,0,-1.2307681,1080.4099,1356.4866)">
          <path style="opacity:0.95;fill:#${base02}" transform="scale(-1)" d="m 721.4667,-779.58405 c 1e-5,1.79493 -4.74801,3.49398 -9.76461,3.49398 v -3.49398 z"/>
          <path style="fill:#${base01}" transform="matrix(2.2708348,0,0,-0.81250075,-2453.4324,1102.1702)" d="m 762,397.0293 a 4.9999999,5.0000001 0 0 0 5,5 v -1 a 3.9999998,4.0000001 0 0 1 -4,-4 z"/>
         </g>
         <g id="tooltip-normal-bottom" transform="matrix(0.83636364,0,0,-1.2307681,1369.0206,1356.4865)">
          <path style="opacity:0.95;fill:#${base02}" d="m -719.81,776.08999 h 55 v 3.49003 h -55 z"/>
          <path style="fill:#${base01}" transform="matrix(1.1956522,0,0,-0.81250075,-1636.8724,1102.1701)" d="m 767,401.0293 v 1 h 46 v -1 z"/>
         </g>
         <g id="tooltip-normal-bottomright" transform="matrix(-0.44036669,0,0,-1.2307681,499.59011,1356.4866)">
          <path style="opacity:0.95;fill:#${base02}" transform="scale(-1)" d="m 721.4666,-779.58382 c 10e-6,1.79493 -4.74797,3.49375 -9.76457,3.49375 v -3.49398 z"/>
          <path style="fill:#${base01}" transform="matrix(-2.2708348,0,0,-0.81250075,1134.4867,1102.1702)" d="m 817,397.0293 a 3.9999998,4.0000001 0 0 1 -4,4 v 1 a 4.9999999,5.0000001 0 0 0 5,-5 z"/>
         </g>
         <g id="arrow-right-normal" transform="translate(-121.56175,-293.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-right-focused" transform="translate(-111.56175,-293.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-right-pressed" transform="translate(-101.56175,-293.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-right-toggled" transform="translate(-91.561747,-293.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-right-disabled" transform="translate(-81.561747,-293.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-left-normal" transform="rotate(180,129.21912,391.5173)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-left-focused" transform="rotate(180,134.21912,391.5173)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-left-pressed" transform="rotate(180,139.21912,391.5173)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-left-toggled" transform="rotate(180,144.21912,391.5173)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-left-disabled" transform="rotate(180,149.21912,391.5173)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-up-normal" transform="rotate(-90,-6.7635551,457.79819)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-up-focused" transform="rotate(-90,-1.7635541,452.79819)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-up-pressed" transform="rotate(-90,3.2364459,447.79819)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-up-toggled" transform="rotate(-90,8.2364459,442.79819)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-up-disabled" transform="rotate(-90,13.236446,437.79819)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-down-normal" transform="rotate(90,260.20181,341.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-down-focused" transform="rotate(90,265.20181,346.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-down-pressed" transform="rotate(90,270.20181,351.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-down-toggled" transform="rotate(90,275.20181,356.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-down-disabled" transform="rotate(90,280.20181,361.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="arrow-plus-normal" transform="translate(103.43825,-81.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="15" y="317"/>
          <path style="fill:#${base05}" d="m 18,317 v 3 h -3 v 2 h 3 v 3 h 2 v -3 h 3 v -2 h -3 v -3 z"/>
         </g>
         <g id="arrow-minus-normal" transform="translate(93.438246,-70.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="25" y="317"/>
          <rect style="fill:#${base05}" width="2" height="8" x="320" y="-33" transform="rotate(90)"/>
         </g>
         <g id="arrow-plus-focused" transform="translate(113.43825,-81.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="15" y="317"/>
          <path style="fill:#${base05}" d="m 18,317 v 3 h -3 v 2 h 3 v 3 h 2 v -3 h 3 v -2 h -3 v -3 z"/>
         </g>
         <g id="arrow-minus-focused" transform="translate(103.43825,-70.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="25" y="317"/>
          <rect style="fill:#${base05}" width="2" height="8" x="320" y="-33" transform="rotate(90)"/>
         </g>
         <g id="arrow-plus-pressed" transform="translate(123.43825,-81.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="15" y="317"/>
          <path style="fill:#${base05}" d="m 18,317 v 3 h -3 v 2 h 3 v 3 h 2 v -3 h 3 v -2 h -3 v -3 z"/>
         </g>
         <g id="arrow-minus-pressed" transform="translate(113.43825,-70.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="25" y="317"/>
          <rect style="fill:#${base05}" width="2" height="8" x="320" y="-33" transform="rotate(90)"/>
         </g>
         <g id="arrow-plus-toggled" transform="translate(133.43825,-81.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="15" y="317"/>
          <path style="fill:#${base05}" d="m 18,317 v 3 h -3 v 2 h 3 v 3 h 2 v -3 h 3 v -2 h -3 v -3 z"/>
         </g>
         <g id="arrow-minus-toggled" transform="translate(123.43825,-70.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="25" y="317"/>
          <rect style="fill:#${base05}" width="2" height="8" x="320" y="-33" transform="rotate(90)"/>
         </g>
         <g id="arrow-plus-disabled" transform="translate(143.43825,-81.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="15" y="317"/>
          <path style="opacity:0.3;fill:#${base05}" d="m 18,317 v 3 h -3 v 2 h 3 v 3 h 2 v -3 h 3 v -2 h -3 v -3 z"/>
         </g>
         <g id="arrow-minus-disabled" transform="translate(133.43825,-70.965356)">
          <rect style="opacity:0.00100002" width="8" height="8" x="25" y="317"/>
          <rect style="opacity:0.3;fill:#${base05}" width="2" height="8" x="320" y="-33" transform="rotate(90)"/>
         </g>
         <g id="tree-plus-normal" transform="translate(-67.561757,-271.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-plus-focused" transform="translate(-57.561757,-271.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-plus-pressed" transform="translate(-47.561757,-271.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-plus-toggled" transform="translate(-37.561757,-271.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-plus-disabled" transform="translate(-27.561752,-271.96536)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-minus-normal" transform="rotate(90,287.20181,368.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-minus-focused" transform="rotate(90,292.20181,373.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-minus-pressed" transform="rotate(90,297.20181,378.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-minus-toggled" transform="rotate(90,302.20181,383.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="tree-minus-disabled" transform="rotate(90,307.20181,388.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="flat-arrow-down-normal" transform="rotate(90,331.20181,379.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="flat-arrow-down-focused" transform="rotate(90,336.20181,384.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="flat-arrow-down-disabled" transform="rotate(90,346.20181,394.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="carrow-normal" transform="rotate(90,281.20178,374.23647)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="carrow-focused" transform="rotate(90,286.20178,379.23647)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="carrow-pressed" transform="rotate(90,291.20178,384.23647)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="carrow-toggled" transform="rotate(90,296.20178,389.23647)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="carrow-disabled" transform="rotate(90,301.20178,394.23647)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="flat-arrow-down-pressed" transform="rotate(90,341.20181,389.23644)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-right-normal" transform="translate(-68,-221)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-right-focused" transform="translate(-58,-221)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base07}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-right-pressed" transform="translate(-48,-221)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-right-toggled" transform="translate(-38,-221)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-right-disabled" transform="translate(-27.999996,-221)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-left-normal" transform="rotate(180,156.00001,427.99998)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-left-focused" transform="rotate(180,161.00001,427.99998)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base07}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-left-pressed" transform="rotate(180,166.00001,427.99998)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-left-toggled" transform="rotate(180,171.00001,427.99998)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-left-disabled" transform="rotate(180,176.00001,427.99998)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-up-normal" transform="rotate(-90,56.5,467.49999)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-up-focused" transform="rotate(-90,61.5,462.49999)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base07}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-up-pressed" transform="rotate(-90,66.5,457.49999)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-up-toggled" transform="rotate(-90,71.5,452.49999)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-up-disabled" transform="rotate(-90,76.5,447.49999)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-down-normal" transform="rotate(90,250.50001,404.50001)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-down-focused" transform="rotate(90,255.50001,409.50001)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base07}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-down-pressed" transform="rotate(90,260.50001,414.50001)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-down-toggled" transform="rotate(90,265.50001,419.50001)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="harrow-down-disabled" transform="rotate(90,270.50001,424.50001)">
          <rect style="opacity:0.00100002" width="8" height="8" x="186" y="529"/>
          <path style="opacity:0.3;fill:#${base05}" transform="matrix(0.72168782,0,0,1,52.663678,0.42535408)" d="m 194.45572,532.57465 -3.46411,2 -3.4641,2 v -4 -4 l 3.4641,2 z"/>
         </g>
         <g id="checkbox-checked-normal" transform="translate(219.00002,157.63772)">
          <g id="checkbox-unchecked-5-59" transform="translate(19)">
           <g id="sdsd-7-54">
            <g id="scdsdcd-5-8" transform="translate(0,-30)">
             <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
             <g>
              <rect style="fill:url(#linearGradient2266);stroke:#000000;stroke-width:0;stroke-linejoin:round" width="14" height="14" x="18" y="31.36" rx="2" ry="2"/>
             </g>
            </g>
           </g>
          </g>
          <g id="checkbox-checked-dark-7-37" transform="translate(36,-1036)">
           <g transform="rotate(45,7.4999938,1026.3622)">
            <g transform="translate(12.374375,11.531233)">
             <g style="fill:#${base02}" transform="translate(-3,-4.9999826)">
              <rect style="fill:#${base01}" width="5" height="2" x="8" y="1033.36" rx=".667" ry=".667"/>
              <rect style="fill:#${base01}" width="2" height="8" x="11" y="1027.36" ry="0"/>
             </g>
             <rect style="fill:#${base05};fill-opacity:0" width="3" height="1" x="5" y="-8" transform="translate(0,1036.3622)"/>
            </g>
           </g>
          </g>
         </g>
         <g id="checkbox-tristate-normal" transform="translate(284.00001,157.63781)">
          <g id="checkbox-unchecked-5-4-5" transform="translate(19)">
           <g id="sdsd-7-0-0">
            <g id="scdsdcd-5-2-0" transform="translate(0,-30)">
             <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
             <g>
              <rect style="fill:url(#linearGradient2268);stroke:#000000;stroke-width:0;stroke-linejoin:round" width="14" height="14" x="18" y="31.36" rx="2" ry="2"/>
             </g>
            </g>
           </g>
          </g>
          <g id="checkbox-checked-dark-7-9-3" transform="translate(36,-1036)">
           <g transform="rotate(45,7.4999938,1026.3622)">
            <g transform="translate(12.374375,11.531233)">
             <g style="fill:#${base02}" transform="translate(-3,-4.9999826)">
              <rect style="fill:#${base01}" width="2" height="8" x="-738.8" y="-725.96" ry="0" transform="rotate(-135)"/>
             </g>
             <rect style="fill:#${base05};fill-opacity:0" width="3" height="1" x="5" y="-8" transform="translate(0,1036.3622)"/>
            </g>
           </g>
          </g>
         </g>
         <g id="radio-checked-normal" transform="translate(-48,157.63781)">
          <g id="radio-unchecked-2-1" transform="translate(19.004264)">
           <g>
            <g id="radio-unchecked2-0-8" transform="matrix(0.93617253,0,0,0.93566004,-96.78315,-244.76084)">
             <rect style="fill:none" width="17.091" height="17.1" x="206.99" y="261.98"/>
             <g>
              <g transform="matrix(0.5089163,0,0,0.51739823,181.7932,197.56426)">
               <g>
                <rect style="fill:url(#linearGradient2270);stroke:#999999;stroke-width:0;stroke-linejoin:round" width="29.385" height="28.919" x="51.61" y="126.56" rx="14.692" ry="14.46"/>
               </g>
              </g>
             </g>
            </g>
           </g>
          </g>
          <rect style="fill:#${base02}" width="4" height="4" x="122" y="6.36" rx="1.999" ry="2"/>
         </g>
         <g id="checkbox-normal" transform="translate(155,157.63782)">
          <g id="sdsd-0-1">
           <g id="scdsdcd-0-4" transform="translate(0,-30)">
            <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
            <g>
             <rect style="fill:#${base02};stroke:#${base01};stroke-linejoin:round" width="13" height="13" x="18.5" y="31.86" rx="2" ry="2"/>
            </g>
           </g>
          </g>
         </g>
         <g id="radio-normal" transform="translate(-96.995736,158.63812)">
          <g>
           <g id="radio-unchecked2-6-5" transform="matrix(0.93617253,0,0,0.93566004,-96.78315,-244.76084)">
            <rect style="fill:none" width="17.091" height="17.1" x="206.99" y="261.98"/>
            <g>
             <g transform="matrix(0.5089163,0,0,0.51739823,181.7932,197.56426)">
              <g>
               <rect style="fill:#${base02};stroke:#${base01};stroke-width:2.08222;stroke-linejoin:round" width="27.304" height="26.836" x="52.66" y="127.6" rx="13.224" ry="13.246"/>
              </g>
             </g>
            </g>
           </g>
          </g>
         </g>
         <g id="checkbox-focused" transform="translate(171,157.63782)">
          <g>
           <g transform="translate(0,-30)">
            <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
            <g>
             <rect style="fill:#${base02};stroke:#${base01};stroke-linejoin:round" width="13" height="13" x="18.5" y="31.86" rx="2" ry="2"/>
            </g>
           </g>
          </g>
         </g>
         <g id="checkbox-checked-focused" transform="translate(235.00002,157.63772)">
          <g transform="translate(19)">
           <g>
            <g transform="translate(0,-30)">
             <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
             <g>
              <rect style="fill:url(#linearGradient2272);stroke:#000000;stroke-width:0;stroke-linejoin:round" width="14" height="14" x="18" y="31.36" rx="2" ry="2"/>
             </g>
            </g>
           </g>
          </g>
          <g transform="translate(36,-1036)">
           <g transform="rotate(45,7.4999938,1026.3622)">
            <g transform="translate(12.374375,11.531233)">
             <g style="fill:#${base02}" transform="translate(-3,-4.9999826)">
              <rect style="fill:#${base01}" width="5" height="2" x="8" y="1033.36" rx=".667" ry=".667"/>
              <rect style="fill:#${base01}" width="2" height="8" x="11" y="1027.36" ry="0"/>
             </g>
             <rect style="fill:#${base05};fill-opacity:0" width="3" height="1" x="5" y="-8" transform="translate(0,1036.3622)"/>
            </g>
           </g>
          </g>
         </g>
         <g id="checkbox-tristate-focused" transform="translate(299,157.63782)">
          <g transform="translate(19)">
           <g>
            <g transform="translate(0,-30)">
             <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
             <g>
              <rect style="fill:url(#linearGradient2274);stroke:#000000;stroke-width:0;stroke-linejoin:round" width="14" height="14" x="18" y="31.36" rx="2" ry="2"/>
             </g>
            </g>
           </g>
          </g>
          <g transform="translate(36,-1036)">
           <g transform="rotate(45,7.4999938,1026.3622)">
            <g transform="translate(12.374375,11.531233)">
             <g style="fill:#${base02}" transform="translate(-3,-4.9999826)">
              <rect style="fill:#${base01}" width="2" height="8" x="-738.8" y="-725.96" ry="0" transform="rotate(-135)"/>
             </g>
             <rect style="fill:#${base05};fill-opacity:0" width="3" height="1" x="5" y="-8" transform="translate(0,1036.3622)"/>
            </g>
           </g>
          </g>
         </g>
         <g id="radio-focused" transform="translate(-80.995736,158.63812)">
          <g>
           <g transform="matrix(0.93617253,0,0,0.93566004,-96.78315,-244.76084)">
            <rect style="fill:none" width="17.091" height="17.1" x="206.99" y="261.98"/>
            <g>
             <g transform="matrix(0.5089163,0,0,0.51739823,181.7932,197.56426)">
              <g>
               <rect style="fill:#${base02};stroke:#${base01};stroke-width:2.08222;stroke-linejoin:round" width="27.304" height="26.836" x="52.66" y="127.6" rx="13.224" ry="13.246"/>
              </g>
             </g>
            </g>
           </g>
          </g>
         </g>
         <g id="radio-checked-focused" transform="translate(-32.000001,157.63781)">
          <g transform="translate(19.004264)">
           <g>
            <g transform="matrix(0.93617253,0,0,0.93566004,-96.78315,-244.76084)">
             <rect style="fill:none" width="17.091" height="17.1" x="206.99" y="261.98"/>
             <g>
              <g transform="matrix(0.5089163,0,0,0.51739823,181.7932,197.56426)">
               <g>
                <rect style="fill:url(#linearGradient2276);stroke:#999999;stroke-width:0;stroke-linejoin:round" width="29.385" height="28.919" x="51.61" y="126.56" rx="14.692" ry="14.46"/>
               </g>
              </g>
             </g>
            </g>
           </g>
          </g>
          <rect style="fill:#${base01}" width="4" height="4" x="122" y="6.36" rx="1.999" ry="2"/>
         </g>
         <g id="menu-checkbox-checked-focused" transform="translate(219.00002,173.63771)">
          <g transform="translate(19)">
           <g>
            <g transform="translate(0,-30)">
             <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
             <g>
              <rect style="fill:#${base05};stroke:#000000;stroke-width:0;stroke-linejoin:round" width="14" height="14" x="18" y="31.36" rx="2" ry="2"/>
             </g>
            </g>
           </g>
          </g>
          <g transform="translate(36,-1036)">
           <g transform="rotate(45,7.4999938,1026.3622)">
            <g transform="translate(12.374375,11.531233)">
             <g style="fill:#${base02}" transform="translate(-3,-4.9999826)">
              <rect style="fill:#${base07}" width="5" height="2" x="8" y="1033.36" rx=".667" ry=".667"/>
              <rect style="fill:#${base07}" width="2" height="8" x="11" y="1027.36" ry="0"/>
             </g>
             <rect style="fill:#${base05};fill-opacity:0" width="3" height="1" x="5" y="-8" transform="translate(0,1036.3622)"/>
            </g>
           </g>
          </g>
         </g>
         <g id="menu-checkbox-tristate-focused" transform="translate(284.00001,173.6378)">
          <g transform="translate(19)">
           <g>
            <g transform="translate(0,-30)">
             <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
             <g>
              <rect style="fill:#${base05};stroke:#000000;stroke-width:0;stroke-linejoin:round" width="14" height="14" x="18" y="31.36" rx="2" ry="2"/>
             </g>
            </g>
           </g>
          </g>
          <g transform="translate(36,-1036)">
           <g transform="rotate(45,7.4999938,1026.3622)">
            <g transform="translate(12.374375,11.531233)">
             <g style="fill:#${base02}" transform="translate(-3,-4.9999826)">
              <rect style="fill:#${base07}" width="2" height="8" x="-738.8" y="-725.96" ry="0" transform="rotate(-135)"/>
             </g>
             <rect style="fill:#${base05};fill-opacity:0" width="3" height="1" x="5" y="-8" transform="translate(0,1036.3622)"/>
            </g>
           </g>
          </g>
         </g>
         <g id="menu-radio-checked-focused" transform="translate(-48,173.6378)">
          <g transform="translate(19.004264)">
           <g>
            <g transform="matrix(0.93617253,0,0,0.93566004,-96.78315,-244.76084)">
             <rect style="fill:none" width="17.091" height="17.1" x="206.99" y="261.98"/>
             <g>
              <g transform="matrix(0.5089163,0,0,0.51739823,181.7932,197.56426)">
               <g>
                <rect style="fill:#${base05};stroke:#999999;stroke-width:0;stroke-linejoin:round" width="29.385" height="28.919" x="51.61" y="126.56" rx="14.692" ry="14.46"/>
               </g>
              </g>
             </g>
            </g>
           </g>
          </g>
          <rect style="fill:#${base07}" width="4" height="4" x="122" y="6.36" rx="1.999" ry="2"/>
         </g>
         <g id="menu-checkbox-normal" transform="translate(155,173.63781)">
          <g>
           <g transform="translate(0,-30)">
            <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
            <g>
             <rect style="fill:#${base02};stroke:#${base01};stroke-linejoin:round" width="13" height="13" x="18.5" y="31.86" rx="2" ry="2"/>
            </g>
           </g>
          </g>
         </g>
         <g id="menu-radio-normal" transform="translate(-96.995736,174.63811)">
          <g>
           <g transform="matrix(0.93617253,0,0,0.93566004,-96.78315,-244.76084)">
            <rect style="fill:none" width="17.091" height="17.1" x="206.99" y="261.98"/>
            <g>
             <g transform="matrix(0.5089163,0,0,0.51739823,181.7932,197.56426)">
              <g>
               <rect style="fill:#${base02};stroke:#${base01};stroke-width:2.08222;stroke-linejoin:round" width="27.304" height="26.836" x="52.66" y="127.6" rx="13.224" ry="13.246"/>
              </g>
             </g>
            </g>
           </g>
          </g>
         </g>
         <g id="menu-checkbox-focused" transform="translate(171,173.63781)">
          <g>
           <g transform="translate(0,-30)">
            <rect style="fill:none" width="16" height="16" x="17" y="30.36"/>
            <g>
             <g>
              <path style="fill:#${base03}" d="m 20.5,31.361328 c -1.37635,0 -2.5,1.12365 -2.5,2.5 v 9 c 0,1.37635 1.12365,2.5 2.5,2.5 h 9 c 1.37635,0 2.5,-1.12365 2.5,-2.5 v -9 c 0,-1.37635 -1.12365,-2.5 -2.5,-2.5 z m 0,1 h 9 c 0.839648,0 1.5,0.660352 1.5,1.5 v 9 c 0,0.839648 -0.660352,1.5 -1.5,1.5 h -9 c -0.839648,0 -1.5,-0.660352 -1.5,-1.5 v -9 c 0,-0.839648 0.660352,-1.5 1.5,-1.5 z"/>
             </g>
            </g>
           </g>
          </g>
         </g>
         <g id="menu-radio-focused" transform="translate(-80.995736,174.63811)">
          <g>
           <g transform="matrix(0.93617253,0,0,0.93566004,-96.78315,-244.76084)">
            <rect style="fill:none" width="17.091" height="17.1" x="206.99" y="261.98"/>
            <g>
             <g transform="matrix(0.5089163,0,0,0.51739823,181.7932,197.56426)">
              <g>
               <g>
                <path style="fill:#${base03}" d="m 65.884766,126.5625 c -7.88589,0 -14.265625,6.3909 -14.265625,14.28711 v 0.34375 c 0,7.89621 6.379735,14.28711 14.265625,14.28711 h 0.855468 c 7.88589,0 14.265625,-6.3909 14.265625,-14.28711 v -0.34375 c 0,-7.89621 -6.379735,-14.28711 -14.265625,-14.28711 z m 0,2.08203 h 0.855468 c 6.766501,0 12.181641,5.42455 12.181641,12.20508 v 0.34375 c 0,6.78053 -5.41514,12.20508 -12.181641,12.20508 h -0.855468 c -6.766501,0 -12.183594,-5.42455 -12.183594,-12.20508 v -0.34375 c 0,-6.78053 5.417093,-12.20508 12.183594,-12.20508 z"/>
               </g>
              </g>
             </g>
            </g>
           </g>
          </g>
         </g>
         <rect id="menubar-normal" style="fill:#${base01}" width="20" height="20" x="795" y="202"/>
         <rect id="menubar-normal-left" style="fill:#${base01}" width="20" height="5" x="202" y="-795" transform="rotate(90)"/>
         <rect id="menubar-normal-topleft" style="fill:#${base01}" width="5" height="5" x="197" y="-795" transform="rotate(90)"/>
         <rect id="menubar-normal-top" style="fill:#${base01}" width="20" height="5" x="795" y="197"/>
         <rect id="menubar-normal-right" style="fill:#${base01}" width="20" height="5" x="202" y="-820" transform="rotate(90)"/>
         <rect id="menubar-normal-topright" style="fill:#${base01}" width="5" height="5" x="197" y="-820" transform="rotate(90)"/>
         <g id="menubar-normal-bottomleft" transform="translate(490,-394.99999)">
          <path style="fill:#${base01}" d="m 300,617 h 5 v 2.99999 h -5 z"/>
          <g id="menubar-normal-bottomleft2" transform="matrix(0.25,0,0,1,223.75,0)">
           <path style="fill:#${base01}" d="m 305,621 h 20 v -1.00001 h -20 z"/>
          </g>
         </g>
         <g id="menubar-normal-bottomright" transform="translate(490,-394.99999)">
          <path style="fill:#${base01}" d="m 325,617 h 5 v 2.99999 h -5 z"/>
          <g id="menubar-normal-bottomright2" style="fill:#b6b6b6" transform="matrix(0.25,0,0,1,248.75,0)">
           <path style="fill:#${base01}" d="m 305,621 h 20 v -1.00001 h -20 z"/>
          </g>
         </g>
         <g id="menubar-normal-bottom" transform="translate(490,-394.99999)">
          <path style="fill:#${base01}" d="m 305,617 h 20 v 2.99999 h -20 z"/>
          <path style="fill:#${base01}" d="m 305,619.99999 h 20 V 621 h -20 z"/>
         </g>
         <path id="tabframe-normal" style="opacity:0.00100002;fill-rule:evenodd" d="m 563.50001,275.99988 v 32 h 32 v -32 z"/>
         <g id="tabframe-normal-left" transform="matrix(0.8,0,0,0.98461538,542.50021,227.9983)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="tabframe-normal-topleft" transform="matrix(0.8,0,0,0.8,542.50021,238.9986)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="m 26.25,41.2516 h -5 v 5 h 5 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2497 l -3e-4,-3.75 h 3.7503 z"/>
         </g>
         <g id="tabframe-normal-top" transform="matrix(0,0.8,-0.98461538,0,643.50159,254.99988)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.25 v -32.5 z"/>
         </g>
         <use id="tabframe-normal-topright" width="100%" height="100%" x="0" y="0" transform="matrix(-1,0,0,1,1159.0003,-3.9218776e-8)" xlink:href="#tabframe-normal-topleft"/>
         <g transform="translate(278.00001,-607.50012)">
          <g id="tabframe-normal-right" transform="matrix(-0.8,0,0,-0.98461538,338.5,963.50158)">
           <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
           <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.25 v -32.5 z"/>
          </g>
          <g id="tabframe-normal-bottom" transform="matrix(0,-0.8,0.98461538,0,237.49862,936.4999)">
           <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
           <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2499 v -32.5 z"/>
          </g>
         </g>
         <use id="tabframe-normal-bottomleft" width="100%" height="100%" x="0" y="0" transform="matrix(1,0,0,-1,-1.765625e-8,583.9997)" xlink:href="#tabframe-normal-topleft"/>
         <use id="tabframe-normal-bottomright" width="100%" height="100%" x="0" y="0" transform="rotate(180,579.50016,291.99983)" xlink:href="#tabframe-normal-topleft"/>
         <path id="tab-toggled" style="opacity:0.00100002;fill-rule:evenodd" d="m 454.00001,275.99988 v 32 h 32 v -32 z"/>
         <g id="tab-toggled-left" transform="matrix(0.8,0,0,0.98461538,433.00021,227.9983)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="tab-toggled-topleft" transform="matrix(0.8,0,0,0.8,433.00001,238.9986)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="m 26.25,41.2516 h -5 v 5 h 5 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <g id="tab-toggled-top" transform="matrix(0,0.8,-0.98461538,0,534.00159,254.99988)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.25 v -32.5 z"/>
         </g>
         <g id="tab-toggled-right" transform="matrix(-0.8,0,0,0.98461538,507.00001,227.9983)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.25 v -32.5 z"/>
         </g>
         <g id="tab-toggled-bottomleft" transform="matrix(1,0,0,0.66666667,279.99991,-302.33346)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="m 174,921.5 h -4 l 1e-4,-6 H 174 Z"/>
          <path style="fill:#${base02}" d="m 171,921.5 h -1 l 1e-4,-6 h 1 z"/>
         </g>
         <path id="tab-toggled-bottom" style="opacity:0.00100002;fill-rule:evenodd" d="m 454.00021,307.99988 h 31.9998 v 4 h -32 z"/>
         <g id="tab-toggled-bottomright" transform="matrix(-1,0,0,0.66666667,660.00021,-302.33356)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 174.0001,921.5 H 170 l 1e-4,-6 h 4 z"/>
          <path style="fill:#${base02}" d="M 171.0001,921.5 H 170 l 1e-4,-6 h 1.0001 z"/>
         </g>
         <rect id="tab-normal" style="fill-opacity:0" width="10" height="10" x="303" y="282.5"/>
         <rect id="tab-normal-top" style="fill-opacity:0" width="10" height="10" x="303" y="272.5"/>
         <rect id="tab-normal-right" style="fill-opacity:0" width="10" height="10" x="313" y="282.5"/>
         <rect id="tab-normal-topright" style="fill-opacity:0" width="10" height="10" x="313" y="272.5"/>
         <rect id="tab-normal-left" style="fill-opacity:0" width="10" height="10" x="293" y="282.5"/>
         <rect id="tab-normal-topleft" style="fill-opacity:0" width="10" height="10" x="293" y="272.5"/>
         <rect id="tab-normal-bottom" style="fill-opacity:0" width="10" height="10" x="303" y="292.5"/>
         <rect id="tab-normal-bottomright" style="fill-opacity:0" width="10" height="10" x="313" y="292.5"/>
         <rect id="tab-normal-bottomleft" style="fill-opacity:0" width="10" height="10" x="293" y="292.5"/>
         <path id="tab-focused" style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="m 402.00001,275.99988 v 32 h 32 v -32 z"/>
         <g id="tab-focused-left" transform="matrix(0.8,0,0,0.98461538,381.00021,227.9983)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="tab-focused-topleft" transform="matrix(0.8,0,0,0.8,381.00001,238.9986)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="m 26.25,41.2516 h -5 v 5 h 5 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <g id="tab-focused-top" transform="matrix(0,0.8,-0.98461538,0,482.00139,254.99988)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="tab-focused-right" transform="matrix(-0.8,0,0,0.98461538,455.00011,227.99831)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="tab-focused-bottomleft" transform="matrix(1,0,0,0.66666667,227.99991,-302.33346)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="m 174,921.5 h -4 l 1e-4,-6 H 174 Z"/>
          <path style="fill:#${base02}" d="m 171,921.5 h -1 l 1e-4,-6 h 1 z"/>
         </g>
         <path id="tab-focused-bottom" style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="m 402.00021,307.99988 h 31.9998 v 4 h -32 z"/>
         <g id="tab-focused-bottomright" transform="matrix(-1,0,0,0.66666667,608.00021,-302.33356)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="M 174.0001,921.5 H 170 l 1e-4,-6 h 4 z"/>
          <path style="fill:#${base02}" d="M 171.0001,921.5 H 170 l 1e-4,-6 h 1.0001 z"/>
         </g>
         <rect id="floating-tab-normal" style="fill-opacity:0" width="10" height="10" x="350.5" y="285"/>
         <g id="tabBarFrame-normal-bottom" transform="matrix(0,-1,0.66666667,0,-255.83335,476.50008)">
          <path style="fill-opacity:0;fill-rule:evenodd" d="m 174,921.5 h -4 l 1e-4,-6 H 174 Z"/>
          <path style="fill:#${base02}" d="m 171,921.5 h -1 l 1e-4,-6 h 1 z"/>
         </g>
         <g id="tabBarFrame-normal-bottomright" transform="matrix(0,-1,0.66666667,0,-259.83335,476.5)">
          <path style="fill-opacity:0;fill-rule:evenodd" d="m 174,921.5 h -4 l 1e-4,-6 H 174 Z"/>
          <path style="fill:#${base02}" d="m 171,921.5 h -1 l 1e-4,-6 h 1 z"/>
         </g>
         <g id="tabBarFrame-normal-bottomleft" transform="matrix(0,-1,0.66666667,0,-251.83335,476.50008)">
          <path style="fill-opacity:0;fill-rule:evenodd" d="m 174,921.5 h -4 l 1e-4,-6 H 174 Z"/>
          <path style="fill:#${base02}" d="m 171,921.5 h -1 l 1e-4,-6 h 1 z"/>
         </g>
         <g id="tab-toggled-topright" transform="matrix(-0.8,0,0,0.8,507.00001,238.9986)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="m 26.25,41.2516 h -5 v 5 h 5 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <g id="tab-focused-topright" transform="matrix(-0.8,0,0,0.8,455.00001,238.9986)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="m 26.25,41.2516 h -5 v 5 h 5 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <path id="floating-tab-toggled" style="opacity:0.00100002;fill-rule:evenodd" d="m 454.0001,224.99987 v 32 h 32 v -32 z"/>
         <g id="floating-tab-toggled-left" transform="matrix(0.8,0,0,0.98461538,433.0003,176.99829)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="floating-tab-toggled-topleft" transform="matrix(0.8,0,0,0.8,433.0001,187.99859)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="m 26.25,41.2516 h -5 v 5 h 5 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <g id="floating-tab-toggled-top" transform="matrix(0,0.8,-0.98461538,0,534.00168,203.99987)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.25 v -32.5 z"/>
         </g>
         <g id="floating-tab-toggled-right" transform="matrix(-0.8,0,0,0.98461538,507.0001,176.99829)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 26.25,81.2514 V 48.7516 h -5 v 32.5 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.25 v -32.5 z"/>
         </g>
         <g id="floating-tab-toggled-bottomleft" transform="matrix(1,0,0,0.66666667,280,-353.33347)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="m 174,921.5 h -4 l 1e-4,-6 H 174 Z"/>
          <path style="fill:#${base02}" d="m 171,921.5 h -1 l 1e-4,-6 h 1 z"/>
         </g>
         <path id="floating-tab-toggled-bottom" style="opacity:0.00100002;fill-rule:evenodd" d="m 454.0003,256.99987 h 31.9998 v 4 h -32 z"/>
         <g id="floating-tab-toggled-bottomright" transform="matrix(-1,0,0,0.66666667,660.0003,-353.33357)">
          <path style="opacity:0.00100002;fill-rule:evenodd" d="M 174.0001,921.5 H 170 l 1e-4,-6 h 4 z"/>
          <path style="fill:#${base02}" d="M 171.0001,921.5 H 170 l 1e-4,-6 h 1.0001 z"/>
         </g>
         <path id="floating-tab-focused" style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="m 402.0001,224.99987 v 32 h 32 v -32 z"/>
         <g id="floating-tab-focused-left" transform="matrix(0.8,0,0,0.98461538,381.0003,176.99829)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" transform="matrix(1.25,0,0,1.015625,-561.25026,-385.93577)" d="m 467,428 v 32 h 3 v -32 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="floating-tab-focused-topleft" transform="matrix(0.8,0,0,0.8,381.0001,187.99859)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" transform="matrix(1.25,0,0,1.25,-561.25001,-488.74824)" d="m 467,425 v 3 h 3 v -3 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <g id="floating-tab-focused-top" transform="matrix(0,0.8,-0.98461538,0,482.00148,203.99987)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" transform="matrix(0,-1.015625,1.25,0,-508.74984,558.59516)" d="m 470,425 v 3 h 32 v -3 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="floating-tab-focused-right" transform="matrix(-0.8,0,0,0.98461538,455.0002,176.9983)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" transform="matrix(-1.25,0,0,1.015625,653.75014,-385.93578)" d="m 502,428 v 32 h 3 v -32 z"/>
          <path style="fill:#${base02}" d="m 21.25,48.7516 v 32.5 h 1.2497 v -32.5 z"/>
         </g>
         <g id="floating-tab-focused-bottomleft" transform="matrix(1,0,0,0.66666667,228,-353.33347)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" transform="matrix(1,0,0,1.5,-295.99991,225.5002)" d="m 467,460 v 4 h 3 v -4 z"/>
          <path style="fill:#${base02}" d="m 171,921.5 h -1 l 1e-4,-6 h 1 z"/>
         </g>
         <path id="floating-tab-focused-bottom" style="opacity:0.06;fill:#${base04};fill-rule:evenodd" d="m 402.0003,256.99987 h 31.9998 v 4 h -32 z"/>
         <g id="floating-tab-focused-bottomright" transform="matrix(-1,0,0,0.66666667,608.0003,-353.33357)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" transform="matrix(-1,0,0,1.5,676.00021,225.50035)" d="m 502,460 v 4 h 3 v -4 z"/>
          <path style="fill:#${base02}" d="M 171.0001,921.5 H 170 l 1e-4,-6 h 1.0001 z"/>
         </g>
         <g id="floating-tab-toggled-topright" transform="matrix(-0.8,0,0,0.8,507.0001,187.99859)">
          <path style="opacity:0.00100002;fill:#${base04};fill-rule:evenodd" d="m 26.25,41.2516 h -5 v 5 h 5 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <g id="floating-tab-focused-topright" transform="matrix(-0.8,0,0,0.8,455.0001,187.99859)">
          <path style="opacity:0.06;fill:#${base04};fill-rule:evenodd" transform="matrix(-1.25,0,0,1.25,653.75001,-488.74824)" d="m 502,425 v 3 h 3 v -3 z"/>
          <path style="fill:#${base02}" d="m 26.25,41.2516 h -5 v 5 h 1.2503 v -3.75 H 26.25 Z"/>
         </g>
         <path id="menuitem-normal-top" style="fill:#${base04};fill-rule:evenodd" d="m 728,67 h 8 v 4 h -8 z"/>
         <path id="menuitem-normal-bottom" style="fill:#${base04};fill-rule:evenodd" d="m 728,79 h 8 v 4 h -8 z"/>
         <path id="menuitem-normal" style="fill:#${base04};fill-rule:evenodd" d="m 728,71 h 8 v 8 h -8 z"/>
         <path id="menuitem-normal-right" style="fill:#${base04};fill-rule:evenodd" d="m 736,71 h 4 v 8 h -4 z"/>
         <path id="menuitem-normal-left" style="fill:#${base04};fill-rule:evenodd" d="m 724,71 h 4 v 8 h -4 z"/>
         <path id="menuitem-normal-topleft" style="fill:#${base04};fill-rule:evenodd" d="m 724,67 h 4 v 4 h -4 z"/>
         <path id="menuitem-normal-topright" style="fill:#${base04};fill-rule:evenodd" d="m 736,67 h 4 v 4 h -4 z"/>
         <path id="menuitem-normal-bottomleft" style="fill:#${base04};fill-rule:evenodd" d="m 724,79 h 4 v 4 h -4 z"/>
         <path id="menuitem-normal-bottomright" style="fill:#${base04};fill-rule:evenodd" d="m 736,79 h 4 v 4 h -4 z"/>
         <g id="menu-shadow-topleft" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#radialGradient11175)" d="m 515,320 h 10 v 10 h -10 z"/>
          <path style="fill:#${base02}" d="m 521,330 c -2e-5,-3 1.94498,-4 4,-4 v 4 z"/>
          <path style="fill:#${base00}" d="m 524.99998,325.00005 a 4.9999999,5.0000001 0 0 0 -5,5 h 1 a 3.9999998,4.0000001 0 0 1 4,-4 z"/>
         </g>
         <g id="menu-shadow-top" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#linearGradient11121)" d="m 525,320 h 46 v 10 h -46 z"/>
          <path style="fill:#${base00}" d="m 525.00004,325.00005 v 1 h 46 v -1 z"/>
          <path style="fill:#${base02}" d="m 524.99769,325.99461 h 46 v 4 h -46 z"/>
         </g>
         <g id="menu-shadow-left" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#linearGradient11133)" d="m 515,330 h 10 v 43 h -10 z"/>
          <path style="fill:#${base00}" d="m 519.99997,329.99999 v 43 h 1 v -43 z"/>
          <path style="fill:#${base02}" d="m 521,330 h 4 v 42.99982 h -4 z"/>
         </g>
         <g id="menu-shadow-topright" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#radialGradient11173)" d="m 571,320 h 10 v 10 h -10 z"/>
          <path style="fill:#${base02}" d="m 574.99999,329.9995 c -10e-6,-2.9995 -1.94498,-4 -4,-4 v 4 z"/>
          <path style="fill:#${base00}" d="m 570.99997,325.00005 v 1 a 3.9999998,4.0000001 0 0 1 4,4 h 1 a 4.9999999,5.0000001 0 0 0 -5,-5 z"/>
         </g>
         <g id="menu-shadow-right" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#linearGradient11125)" d="m 571,330 h 10 v 43 h -10 z"/>
          <path style="fill:#${base00}" d="m 574.99998,329.99999 v 43 h 1 v -43 z"/>
          <path style="fill:#${base02}" d="m 574.99995,329.99385 h -4 v 42.99982 h 4 z"/>
         </g>
         <g id="menu-shadow-bottomleft" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#radialGradient11177)" d="m 515,373 h 10 v 10 h -10 z"/>
          <path style="fill:#${base02}" d="m 521,373 c -2e-5,3 1.94498,4 4,4 v -4 z"/>
          <path style="fill:#${base00}" d="m 519.99998,372.99998 a 4.9999999,5.0000001 0 0 0 5,5 v -1 a 3.9999998,4.0000001 0 0 1 -4,-4 z"/>
         </g>
         <g id="menu-shadow-bottom" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#linearGradient11129)" d="m 571,373 v 10 h -46 v -10 z"/>
          <path style="fill:#${base00}" d="m 525.00004,377 v 1 h 46 v -1 z"/>
          <path style="fill:#${base02}" d="m 525,377 h 46 v -4 h -46 z"/>
         </g>
         <g id="menu-shadow-bottomright" transform="translate(17.00002,-189)">
          <path style="opacity:0.3;fill:url(#radialGradient11179)" d="m 571,373 h 10 v 10 h -10 z"/>
          <path style="fill:#${base02}" d="M 575,373.00026 C 574.99998,376 573.05502,377 571,377 v -4 z"/>
          <path style="fill:#${base00}" d="m 574.99997,372.99998 a 3.9999998,4.0000001 0 0 1 -4,4 v 1 a 4.9999999,5.0000001 0 0 0 5,-5 z"/>
         </g>
         <path id="menu-normal" style="fill:#${base02}" d="m 475.00001,140.99942 h 46 v 43 h -46 z"/>
         <g id="menu-normal-topleft" transform="translate(17.00002,-189)">
          <path style="fill:#${base02}" d="m 454.00001,330 c -10e-6,-3 1.94498,-4 4,-4 v 4 z"/>
          <path style="fill:#${base00}" d="m 457.99999,325.00005 a 4.9999999,5.0000001 0 0 0 -5,5 h 1 a 3.9999998,4.0000001 0 0 1 4,-4 z"/>
         </g>
         <g id="menu-normal-top" transform="translate(17.00002,-189)">
          <path style="fill:#${base00}" d="m 458.00005,325.00005 v 1 h 46 v -1 z"/>
          <path style="fill:#${base02}" d="m 457.9977,325.99461 h 46 v 4 h -46 z"/>
         </g>
         <g id="menu-normal-left" transform="translate(17.00002,-189)">
          <path style="fill:#${base00}" d="m 452.99998,329.99999 v 43 h 1 v -43 z"/>
          <path style="fill:#${base02}" d="m 454.00001,330 h 4 v 42.99982 h -4 z"/>
         </g>
         <g id="menu-normal-topright" transform="translate(17.00002,-189)">
          <path style="fill:#${base02}" d="m 508,329.9995 c 0,-2.9995 -1.94498,-4 -4,-4 v 4 z"/>
          <path style="fill:#${base00}" d="m 503.99998,325.00005 v 1 a 3.9999998,4.0000001 0 0 1 4,4 h 1 a 4.9999999,5.0000001 0 0 0 -5,-5 z"/>
         </g>
         <g id="menu-normal-right" transform="translate(17.00002,-189)">
          <path style="fill:#${base00}" d="m 507.99999,329.99999 v 43 h 1 v -43 z"/>
          <path style="fill:#${base02}" d="m 507.99996,329.99385 h -4 v 42.99982 h 4 z"/>
         </g>
         <g id="menu-normal-bottomleft" transform="translate(17.00002,-189)">
          <path style="fill:#${base02}" d="m 454.00001,373 c -10e-6,3 1.94498,4 4,4 v -4 z"/>
          <path style="fill:#${base00}" d="m 452.99999,372.99998 a 4.9999999,5.0000001 0 0 0 5,5 v -1 a 3.9999998,4.0000001 0 0 1 -4,-4 z"/>
         </g>
         <g id="menu-normal-bottom" transform="translate(17.00002,-189)">
          <path style="fill:#${base00}" d="m 458.00005,377 v 1 h 46 v -1 z"/>
          <path style="fill:#${base02}" d="m 458.00001,377 h 46 v -4 h -46 z"/>
         </g>
         <g id="menu-normal-bottomright" transform="translate(17.00002,-189)">
          <path style="fill:#${base02}" d="m 508.00001,373.00026 c 0,2.99974 -1.94498,3.99974 -4,3.99974 v -4 z"/>
          <path style="fill:#${base00}" d="m 507.99998,372.99998 a 3.9999998,4.0000001 0 0 1 -4,4 v 1 a 4.9999999,5.0000001 0 0 0 5,-5 z"/>
         </g>
         <path id="menu-shadow-hint-bottom" style="fill:#${base0E}" d="m 564.00002,188 h 2 v 6 h -2 z"/>
         <path id="menu-shadow-hint-top" style="fill:#${base0E}" d="m 564.00002,131 h 2 v 6 h -2 z"/>
         <path id="menu-shadow-hint-right" style="fill:#${base0E}" d="m 592,163.49376 v -2 h 6 v 2 z"/>
         <path id="menu-shadow-hint-left" style="fill:#${base0E}" d="m 532.00002,163 v -2 h 6 v 2 z"/>
         <g id="button-normal-left" transform="matrix(0.8,0,0,0.98461538,105,-30.001575)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-normal-topleft" transform="matrix(0.8,0,0,0.8,105,-21.001285)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <path id="button-normal" style="fill:#${base02};fill-rule:evenodd" d="m 128,17.999997 v 31.999999 h 32 V 17.999997 Z"/>
         <g id="button-normal-top" transform="matrix(0,0.8,-0.98461538,0,208.00158,-5.0000047)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-normal-topright" transform="matrix(-0.8,0,0,0.8,183,-21.001285)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-normal-bottom" transform="matrix(0,-0.8,-0.98461538,0,208.00138,72.999996)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-normal-right" transform="matrix(-0.8,0,0,0.98461538,183,-30.00158)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-normal-bottomleft" transform="matrix(0.8,0,0,-0.8,104.9998,89.001276)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-normal-bottomright" transform="matrix(-0.8,0,0,-0.8,182.9998,89.001276)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-focused-left" transform="matrix(0.8,0,0,0.98461538,151.0002,-30.001575)">
          <path style="fill:#${base04};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base01}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-focused-topleft" transform="matrix(0.8,0,0,0.8,151.0002,-21.001285)">
          <path style="fill:#${base04};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <path id="button-focused" style="fill:#${base04};fill-rule:evenodd" d="m 174.0002,17.999997 v 31.999999 h 32 V 17.999997 Z"/>
         <g id="button-focused-top" transform="matrix(0,0.8,-0.98461538,0,254.00178,-5.0000047)">
          <path style="fill:#${base04};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-focused-topright" transform="matrix(-0.8,0,0,0.8,229.0002,-21.001285)">
          <path style="fill:#${base04};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-focused-bottom" transform="matrix(0,-0.8,-0.98461538,0,254.00158,72.999996)">
          <path style="fill:#${base04};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base01}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-focused-right" transform="matrix(-0.8,0,0,0.98461538,229.0002,-30.00158)">
          <path style="fill:#${base04};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-focused-bottomleft" transform="matrix(0.8,0,0,-0.8,151,89.001276)">
          <path style="fill:#${base04};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base01}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-focused-bottomright" transform="matrix(-0.8,0,0,-0.8,229,89.001276)">
          <path style="fill:#${base04};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-pressed-left" transform="matrix(0.8,0,0,0.98461538,197.0002,-30.001575)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.875125 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-pressed-topleft" transform="matrix(0.8,0,0,0.8,197.0002,-21.001285)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876606 c -4.125,-5.1e-5 -6.875155,2.749964 -6.875125,6.874994 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <path id="button-pressed" style="fill:#${base07};fill-rule:evenodd" d="m 220.0002,17.999997 v 31.999999 h 32 V 17.999997 Z"/>
         <g id="button-pressed-top" transform="matrix(0,0.8,-0.98461538,0,300.00178,-5.0000047)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.874994 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-pressed-topright" transform="matrix(-0.8,0,0,0.8,275.0002,-21.001285)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876606 c -4.125,-5.1e-5 -6.874905,2.749964 -6.874875,6.874994 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-pressed-bottom" transform="matrix(0,-0.8,-0.98461538,0,300.00158,72.999996)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.875005 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-pressed-right" transform="matrix(-0.8,0,0,0.98461538,275.0002,-30.00158)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.874875 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-pressed-bottomleft" transform="matrix(0.8,0,0,-0.8,197,89.001276)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876595 c -4.125,-5.1e-5 -6.875155,2.749975 -6.875125,6.875005 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-pressed-bottomright" transform="matrix(-0.8,0,0,-0.8,275,89.001276)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876595 c -4.125,-5.1e-5 -6.874905,2.749975 -6.874875,6.875005 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-toggled-left" transform="matrix(0.8,0,0,0.98461538,243.0002,-30.001575)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.875125 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-toggled-topleft" transform="matrix(0.8,0,0,0.8,243.0002,-21.001285)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876606 c -4.125,-5.1e-5 -6.875155,2.749964 -6.875125,6.874994 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <path id="button-toggled" style="fill:#${base07};fill-rule:evenodd" d="m 266.0002,17.999997 v 31.999999 h 32 V 17.999997 Z"/>
         <g id="button-toggled-top" transform="matrix(0,0.8,-0.98461538,0,346.00178,-5.0000047)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.874994 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-toggled-topright" transform="matrix(-0.8,0,0,0.8,321.0002,-21.001285)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876606 c -4.125,-5.1e-5 -6.874905,2.749964 -6.874875,6.874994 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-toggled-bottom" transform="matrix(0,-0.8,-0.98461538,0,346.00158,72.999996)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.875005 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-toggled-right" transform="matrix(-0.8,0,0,0.98461538,321.0002,-30.00158)">
          <path style="fill:#${base07};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -6.874875 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="button-toggled-bottomleft" transform="matrix(0.8,0,0,-0.8,243,89.001276)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876595 c -4.125,-5.1e-5 -6.875155,2.749975 -6.875125,6.875005 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="button-toggled-bottomright" transform="matrix(-0.8,0,0,-0.8,321,89.001276)">
          <path style="fill:#${base07};fill-rule:evenodd" d="m 28.75,41.876595 c -4.125,-5.1e-5 -6.874905,2.749975 -6.874875,6.875005 H 28.75 Z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="lineedit-normal-left" transform="matrix(0.8,0,0,0.98461538,105,26.99843)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="lineedit-normal-topleft" transform="matrix(0.8,0,0,0.8,105,35.99872)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <path id="lineedit-normal" style="fill:#${base02};fill-rule:evenodd" d="M 128,75.000002 V 107 h 32 V 75.000002 Z"/>
         <g id="lineedit-normal-top" transform="matrix(0,0.8,-0.98461538,0,208.00158,52)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="lineedit-normal-topright" transform="matrix(-0.8,0,0,0.8,183,35.99872)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="lineedit-normal-bottom" transform="matrix(0,-0.8,-0.98461538,0,208.00138,130)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="lineedit-normal-right" transform="matrix(-0.8,0,0,0.98461538,183,26.998425)">
          <path style="fill:#${base02};fill-rule:evenodd" d="M 28.75,81.2514 V 48.7516 h -7.5 v 32.5 z"/>
          <path style="fill:#${base00}" d="m 21.25,48.7516 v 32.5 h 2.5 v -32.5 z"/>
         </g>
         <g id="lineedit-normal-bottomleft" transform="matrix(0.8,0,0,-0.8,104.9998,146.00128)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <g id="lineedit-normal-bottomright" transform="matrix(-0.8,0,0,-0.8,182.9998,146.00128)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 7.5 z"/>
          <path style="fill:#${base00}" d="m 28.75,41.2516 c -4.125,-5.1e-5 -7.50003,3.37497 -7.5,7.5 h 2.5 c 0,-3.125 1.875,-5 5,-5 z"/>
         </g>
         <path id="lineedit-focused" style="fill:#${base02};fill-rule:evenodd" d="M 175.9998,75.000003 V 107 h 32 V 75.000003 Z"/>
         <g id="lineedit-focused-topleft" transform="translate(0,121.97101)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 175.9998,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 6 z"/>
          <path style="fill:#${base01}" d="m 176,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 2 c 0,-2.5 1.5,-4 4,-4 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 c -2,0 -4,1 -4,4 h 2 c 0,-2 2,-2 2,-2 z"/>
         </g>
         <g id="lineedit-focused-top" transform="translate(0,121.97101)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 176,-46.971008 h 31.9998 v -6 h -32 z"/>
          <path style="fill:#${base01}" d="m 207.9998,-52.971008 h -32 v 2 h 32 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 h 32 v 2 h -32 z"/>
         </g>
         <g id="lineedit-focused-topright" transform="rotate(90,131.0145,30.014496)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 175.9998,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 6 z"/>
          <path style="fill:#${base01}" d="m 176,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 2 c 0,-2.5 1.5,-4 4,-4 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 c -2,0 -4,1 -4,4 h 2 c 0,-2 2,-2 2,-2 z"/>
         </g>
         <g id="lineedit-focused-right" transform="rotate(90,131.0145,30.014496)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 176,-46.971008 h 31.9998 v -6 h -32 z"/>
          <path style="fill:#${base01}" d="m 207.9998,-52.971008 h -32 v 2 h 32 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 h 32 v 2 h -32 z"/>
         </g>
         <g id="lineedit-focused-bottomright" transform="rotate(180,192,30.014496)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 175.9998,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 6 z"/>
          <path style="fill:#${base01}" d="m 176,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 2 c 0,-2.5 1.5,-4 4,-4 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 c -2,0 -4,1 -4,4 h 2 c 0,-2 2,-2 2,-2 z"/>
         </g>
         <g id="lineedit-focused-bottom" transform="rotate(180,192,30.014496)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 176,-46.971008 h 31.9998 v -6 h -32 z"/>
          <path style="fill:#${base01}" d="m 207.9998,-52.971008 h -32 v 2 h 32 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 h 32 v 2 h -32 z"/>
         </g>
         <g id="lineedit-focused-bottomleft" transform="rotate(-90,252.9854,30.014396)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 175.9998,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 6 z"/>
          <path style="fill:#${base01}" d="m 176,-52.971008 c -3.3,-4.1e-5 -6.00002,2.699976 -6,6 h 2 c 0,-2.5 1.5,-4 4,-4 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 c -2,0 -4,1 -4,4 h 2 c 0,-2 2,-2 2,-2 z"/>
         </g>
         <g id="lineedit-focused-left" transform="rotate(-90,252.9854,30.014396)">
          <path style="fill:#${base02};fill-rule:evenodd" d="m 176,-46.971008 h 31.9998 v -6 h -32 z"/>
          <path style="fill:#${base01}" d="m 207.9998,-52.971008 h -32 v 2 h 32 z"/>
          <path style="fill:#${base07}" d="m 176,-50.971008 h 32 v 2 h -32 z"/>
         </g>
        </svg>
      '';
    };
  };
}
