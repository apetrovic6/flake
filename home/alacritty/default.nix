{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 13;
	normal =  {
          family = "FiraCodeNerdFont";
	  style = "Retina";
	};
      };

     window = {
	padding =  {
	  x = 15;
	  y = 15;
	};

	};
   #     draw_bold_text_with_bright_colors = true;
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      };
   };
}
