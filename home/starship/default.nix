{ config, pkgs, ...}:

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
      line_break.disabled = true;
     format = lib.concatStrings [
    "$os"
    "$username"
    "$hostname"
    "$package"
    "$go"
    "$directory"
    "$git_branch"
    "$git_commit"
    "$git_state"
    "$git_metrics"
    "$git_status"
    "$golang"

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
        format = " [$symbol]($style)";
        style = "bold blue";
        disabled = false;
        symbols = {
          NixOS = " ";
        };
      };

#     package = {
#       format = "via [🎁 $version](208 bold)";
#     };

     character =  {
       success_symbol = "[](bold green)";
       error_symbol = "[](bold red)";
     };

     directory =  {
       read_only = "";
       truncation_length = 10;
       truncate_to_repo = true;
       format = "[in](bold) [$path]($style)[$read_only]($read_only_style) ";
       style = "bold italic blue";
     };

    golang =  {
      format = "[ $version](bold cyan)";
      detect_files = ["go.mod"];
      symbol = "";
    };

    };
};

}
