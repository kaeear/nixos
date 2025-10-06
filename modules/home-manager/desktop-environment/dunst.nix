{ pkgs, lib, config, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 1;
	width = "(150, 800)";
	height = "(0, 400)";
        origin = "top-center";
	offset = "(0, 3)";
	scale = 0;
	notification_limit = 3;
	progress_bar = true;
	progress_bar_height = 15;
	progress_bar_frame_width = 0;
	progress_bar_min_width = 200;
	progress_bar_max_width = 400;
	progress_bar_corner_radius = 15;
	progress_bar_corners = "all";
	icon_corner_radius = 0;
	icon_corners = "all";
	indicate_hidden = "no";
	transparency = 0;
	seperator_height = 5;
	padding = 12;
	horizontal_padding = 12;
	text_icon_padding = 0;
	frame_width = 5;
	frame_color = "#89b4fa";
	gap_size = 0;
	seperator_color = "frame";
	sort = "yes";
	follow = "none";
	font = "Mononoki 20";
	line_height = 0;
	markup = "full";
	format = "<b>%s</b>\n%b";
	alignment = "center";
	vertical_alignment = "center";
	show_age_threshold = 60;
	ellipsize = "middle";
	ignore_newline = "no";
        stack_duplicates = "true";
	hide_duplicat_count = "false";
        show_indicators = "no";
	enable_recursive_icon_lookup = "ture";
	icon_theme = "Adwaita";
	icon_position = "left";
	min_icon_size = 0;
	max_icon_size = 32;
	sticky_history = "yes";
	history_lengh = 20;
	corner_radius = 15;
	corners = "all";
	mouse_left_click = "close_current";
	mouse_middle_click = "do_action, close_current";
	mouse_right_click = "close_all";
      };
      urgency_low = {
        background = "#1e1e2e";
	foreground = "#cdd6f4";
	highlight = "#89b4fa";
	timeout = 10;
      };
      urgency_normal = {
        background = "#1e1e2e";
	foreground = "#cdd6f4";
	highlight = "#89b4fa";
	timeout = 10;
	override_pause_level = 30;
      };
      urgency_critical = {
        background = "#1e1e2e";
	foreground = "#f38ba8";
	highlight = "#f9e2af";
	timeout = 10;
	override_pause_level = 60;
	frame_color = "#f38ba8";
      };
    };
  };
}
