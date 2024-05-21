{ config, nixpkgs, ...}:

{
 wayland.windowManager.hyprland.settings = {
    decoration = {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

      rounding = 10;
    
      blur = {
        enabled = true;
        size = 5;
        passes = 2; 

        new_optimizations = true;
        xray = false;
      };

      drop_shadow = "yes";
      shadow_range = 4;
      shadow_render_power = 3;
#      "col.shadow" = "rgba(1a1a1aee)";
    };


  };
}
