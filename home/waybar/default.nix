{ config, pkgs, ... }:

{
  imports = [ ./modules/hypr-modules.nix ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {

      mainBar = {
        height = 10;
        layer = "top";
        position = "top";
        margin-top = 10;
        margin-left = 20;
        margin-right = 20;
        modules-left = [ "cpu" "memory" "custom/weather" "mpris" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "network"
          "pulseaudio"
          "backlight"
          "battery"
          "clock"
          "tray"
          "hyprland/language"
          "custom/launcher"
        ];
        #            modules-right = ["network" "pulseaudio" "bluetooth" "clock" "tray" "hyprland/language" "custom/launcher" ];

        "tray" = { spacing = 10; };
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%b %d %Y}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        "cpu" = {
          interval = 10;
          format = "  {}%";
          max-length = 10;
          on-click = "";
        };
        "memory" = {
          interval = 30;
          format = " {}%";
          format-alt = " {used:0.1f}GB";
          max-length = 10;
        };
        "temperature" = {
          interval = 10;
          format = " {temperatureC}°C";
          max-length = 10;
        };
        "backlight" = {
          device = "intel_backlight";
          format = "{icon}";
          tooltip = true;
          format-alt = "<small>{percent}%</small>";
          format-icons = [ "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          smooth-scrolling-threshold = "2400";
          tooltip-format = "Brightness {percent}%";
        };
        "network" = {
          format-wifi = "<small>{bandwidthDownBytes}</small> {icon}";
          min-length = 10;
          #            fixed-width = 10;
          max-length = 10;
          format-ethernet = "󰈀 <small>{bandwidthDownBytes}</small>";
          format-disconnected = "󰤭";
          tooltip-format = "{essid}";
          interval = 1;
          #            on-click = "~/.config/waybar/scripts/network/rofi-network-manager.sh";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        };

        "bluetooth" = {
          format = "{icon}";
          format-alt = "bluetooth: {status}";
          interval = 30;
          format-icons = {
            enabled = "";
            disabled = "󰂲";
          };
          tooltip-format = "{status}";
        };

        "pulseaudio" = {
          format = "{icon}";
          format-muted = "󰖁";
          format-icons = { default = [ "" "" "󰕾" ]; };
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 1";
          on-scroll-down = "pamixer -d 1";
          on-click-right = "exec pavucontrol";
          tooltip-format = "Volume {volume}%";
        };

        "battery" = {
          bat = "BAT0";
          adapter = "ADP0";
          interval = 60;
          states = {
            warning = 20;
            critical = 15;
          };
          max-length = 20;
          format = "{icon}";
          format-warning = "{icon}";
          format-critical = "{icon}";
          format-charging = "<span font-family='Font Awesome 6 Free'></span>";
          format-plugged = "󰚥";
          format-notcharging = "󰚥";
          format-full = "󰂄";

          format-alt = "<small>{capacity}%</small> ";
          format-icons = [ "󱊡" "󱊢" "󱊣" ];
        };

        "custom/weather" = {
          #            exec = "nix-shell ~/.config/waybar/scripts/weather.py";
          restart-interval = 300;
          return-type = "json";
        };

        "mpris" = {
          format = "{player_icon} {title}";
          format-paused = " {status_icon} <i>{title}</i>";
          max-length = 80;
          player-icons = {
            default = "▶";
            mpv = "🎵";
          };
          status-icons = { paused = "⏸"; };
        };

        "custom/spotify" = {
          #            exec = "nix-shell ~/.config/waybar/scripts/mediaplayer.py --player youtube-music";
          format = " {}";
          return-type = "json";
          on-click = "playerctl play-pause";
          on-double-click-right = "playerctl next";
          on-scroll-down = "playerctl previous";
        };

        "custom/power-menu" = {
          format = "{percentage}Hz";
          #           on-click = "~/.config/hypr/scripts/screenHz.sh";
          return-type = "json";
          exec = "cat ~/.config/hypr/scripts/hz.json";
          interval = 1;
          tooltip = false;
        };

        "custom/launcher" = {
          format = "󱄅";
          on-click = "rofi -show drun &";
        };

        "custom/wallpaper" = {
          format = "󰸉";
          #            on-click = "bash ~/.config/waybar/scripts/changewallpaper.sh";
        };
      };
    };

    style = ''
            * {
        font-family: Material Design Icons, JetBrainsMono Nerd Font, Iosevka Nerd Font ;
        font-size: 14px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        border-radius: 20px;
      }


      #custom-launcher {  
        margin-right: 8px;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #network, 
      #disk,
      #temperature,
      #backlight,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #mpd,
      #clock,
      #bluetooth,
      #window,
      #language,
      #tray,
      #power {
          border-radius: 5px;
          margin: 5px 20px 5px 0px;
          padding: 0px 10px;
          min-width: 50px;
      }

      #workspaces {
        margin-top: 5px;
        margin-left: 5px;
       background: rgba(0,0,0,0);
      }

      #bluetooth  {
       background: @base0C;
      }

      #workspaces button {
        margin-top: 7px;
        margin-left: 7px;
        border-radius: 8px;
      }
      #cpu{
          margin-left: 20px;
      }

      #custom-launcher{
          margin-right: 25px;
      }

      #custom-launcher {
        font-size: 23px;
        background: @base01;
        border-radius: 5px;
        min-width: 40px; 
        margin-top: 5px;
        margin-bottom: 5px;
      }

      window#waybar.hidded {
          opacity: 0.0;
      }


    '';

  };
}
