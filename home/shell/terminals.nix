{ pkgs, ... }:
let
  font = "Iosevka";
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = font;
      size = 14;
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
      adjust_line_height = 1;
      adjust_column_width = 1;
      # modify_font = "underline_thickness = 150%";
      modify_font = "underline_position 10";
      undercurl_style = "thick-sparse";
      background_opacity = 1.0;
      dynamic_background_opacity = "yes";
      window_padding_width = 4;
      hide_window_decorations = "no";
      confirm_os_window_close = 0;
      remember_window_size = "yes";
      cursor_shape = "beam";
      enable_audio_bell = "no";
      editor = "nvim";
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };
  };
}
