{ config, inputs, pkgs, ... }:

{
  imports = [ ./animations.nix ./decorations.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {

      monitor = "DP-3,3840x2160@120,0x0,1";
      #     monitor="eDP-1,2560x1600@240,0x0,1";

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_DRM_DEVICES,/dev/dri/card1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

      "exec-once" = [ "waybar &" "swww-daemon &" ];

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
        kb_layout = "us";
        #  kb_variant =
        #  kb_model =
        #  kb_options =
        #  kb_rules =

        follow_mouse = 1;

        touchpad = { natural_scroll = true; };

        sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 10;
        gaps_out = 25;
        border_size = 2;

        # Controled by stylix
        #     "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        #     "col.inactive_border" = "rgba(595959aa)";

        # master or dwindle
        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      #      master = { new_is_master = "false"; };

      gestures = { workspace_swipe = "true"; };

      "windowrulev2" = [
        # Picture-in-a-Picture (PIP) rules: Oddly, some need re-duplication.  This is because the window for
        # PIP changes after on first launch, and will not inherant the rules...
        #"opacity 0.95 0.75,title:^(Picture in picture)$"  # for opacity: [focus num] [bg num]

        # Interestingly, the opacity rule above doesn't need the reduplication?
        "pin,title:^(Picture in picture)$"

        #windowrulev2=pin,title:^(Firefox)$ 
        "float, title:^(Picture in picture)$"

        #windowrulev2=float, title:^(Firefox)$
        "size 25% 25%,title:^(Picture in picture)$"

        #windowrulev2=size 25% 25%,title:^(Firefox)$ 
        "move 72% 7%,title:^(Picture in picture)$"
        #windowrulev2=move 72% 7%,title:^(Firefox)$ 
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, alacritty"
        "$mod, E, exec, cosmic-files"

        "$mod, Q, killactive,"
        "$mod SHIFT, M, exit,"

        "$mod, B, exec, brave"
        "$mod, $mod_L, exec, rofi -show drun"

        # Move Focus with mod + arrow keys 
        "$mod, left, moveFocus, l"
        "$mod, right, moveFocus, r"
        "$mod, up, moveFocus, u"
        "$mod, down, moveFocus, d"

        # Move Windows
        "$mod CTRL, left, moveWindow, l"
        "$mod CTRL, right, moveWindow, r"
        "$mod CTRL, up, moveWindow, u"
        "$mod CTRL, down, moveWindow, d"

        # Resize Windows
        "$mod SHIFT, left, resizeActive,-50 0"
        "$mod SHIFT, right, resizeActive,50 0"
        "$mod SHIFT, up, resizeActive,0 -50"
        "$mod SHIFT, down, resizeActive,0 50"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_right, workspace, e+1"
        "$mod, mouse_left, workspace, e-1"

        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizeActive"

        ''$mod SHIFT, C, exec, brave --app="https://chat.openai.com"''

        # Brightness
        ",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"

        # Volume control
        # ",XF86AudioLowerVolume, exec, "

        ", Print, exec, grimblast copy area"

        # Screenshot 
        ''
          $mod SHIFT, S,exec, grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png'' # screenshot of a region
        "$mod SHIFT CTRL, S, exec, grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png" # screenshot of the whole screen

        # Toggle Waybar
        "$mod SHIFT, B, exec, pkill -SIGUSR1 waybar"

        "$mod, V, togglefloating"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));
    };

  };

}
