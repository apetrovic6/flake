{ config, pkgs, lib, ...}:

{
# starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    
    enableBashIntegration = true;
    enableZshIntegration = true;

    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
     format = lib.concatStrings [
    "$os"
    "$username"
    "$hostname"
    "$directory"
    "$git_branch"
    "$git_commit"
    "$git_state"
    "$git_metrics"
    "$git_status"

#    "$fill"

    "$golang"
    "$kotlin"
    "$nodejs"
    "$dotnet"
    "$rust"
    "$python"
    "$c"
    "$cmake"

    "$container"
    "$docker_context"
    "$kubernetes"
    
    "$nix_shell"

    "$cmd_duration"
    "$jobs"
    "$time"

    "$line_break"
    "$character"


  ];
      username =  {
      style_user = "white bold";
      style_root = "red bold";
      disabled = false;
      show_always = true;
      format = "[$user]($style) ";
      
      };

      hostname =  {
        ssh_only = false;
	disabled = false;

        format = "[$ssh_symbol](bold blue)@ [$hostname](bold white) ";
	
      };


      os = {
        format = "[$symbol]($style) ";
        style = "bold blue";
        disabled = false;
        symbols = {
          NixOS = " ";
        };
      };

     character =  {
       success_symbol = "[󱞪](bold green)";
       error_symbol = "[](bold red)";
     };

     directory =  {
       read_only = " ";
       truncation_length = 10;
       truncate_to_repo = true;
       format = "[in](bold) [$path]($style)[$read_only]($read_only_style) ";
       style = "bold italic blue";
     };

      directory.substitutions = {
        "~" = "󰋞 ";
        "Documents" = "  ";
        "Downloads" = "  ";
        "Music" = "  ";
        "Pictures" = "  ";
      };


    golang =  {
      symbol = " ";
    };
     
     nix_shell =  {
       symbol = " ";
     };

    };
};

}
