{ config, inputs, pkgs, ... }:

{
  imports = [
#    ./animations.nix
  ];


   wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    
    settings = {

    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input = {
      kb_layout = "us";
    #  kb_variant =
    #  kb_model =
    #  kb_options =
    #  kb_rules =

      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
      };

      sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
    };


    general = {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 10;
      gaps_out = 25;
      border_size = 2;
      col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      col.inactive_border = "rgba(595959aa)";

      layout = "dwindle";

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;
    };

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
      col.shadow = "rgba(1a1a1aee)";
    };


    "$mod" = "SUPER";

    bind =
      [
        "$mod, Return, exec, alacritty"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, B, exec, brave-browser"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

  };

}
