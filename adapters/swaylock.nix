{ config, ... }:

{
  programs.swaylock.settings = with config.colorScheme.colors; {
    color = base00;
    line-color = base00;
    ring-color = base09;
    inside-color = base00;
    key-hl-color = base0A;
    separator-color = base00;
    text-color = base05;
    text-caps-lock-color = base05;
    line-ver-color = base09;
    ring-ver-color = base09;
    inside-ver-color = base00;
    text-ver-color = base0D;
    ring-wrong-color = base08;
    text-wrong-color = base08;
    inside-wrong-color = base00;
    inside-clear-color = base00;
    text-clear-color = base0D;
    ring-clear-color = base0D;
    line-clear-color = base0D;
    line-wrong-color = base00;
    bs-hl-color = base0D;

    layout-text-color = base05;
    layout-bg-color = "00000000";
  };
}
