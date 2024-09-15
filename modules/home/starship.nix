
{
  programs.starship = {
    enable = true;
    settings = {
      format = "$all";

      prompt_order = [
        "username"
        "hostname"
        "directory"
        "git_branch"
        "package"
        "nodejs"
        "rust"
        "golang"
        "php"
        "gcloud"
        "conda"
        "nix_shell"
        "time"
        "character"
      ];

      username = {
        style = "bold fg:#b8bb26";
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname](bold fg:#fabd2f)";
      };

      directory = {
        format = "[$path](bold fg:#83a598) ";
        style = "bold fg:#83a598";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = " ";
        style = "bold fg:#8ec07c";
        format = "on [$branch]($style) ";
      };

      package = {
        symbol = " ";
        style = "bold fg:#fabd2f";
        disabled = false;
      };

      nodejs = {
        symbol = " ";
        style = "bold fg:#b8bb26";
        disabled = false;
      };

      rust = {
        symbol = " ";
        style = "bold fg:#d3869b";
        disabled = false;
      };

      golang = {
        symbol = " ";
        style = "bold fg:#fabd2f";
        disabled = false;
      };

      php = {
        symbol = " ";
        style = "bold fg:#d3869b";
        disabled = false;
      };

      gcloud = {
        symbol = " ";
        style = "bold fg:#fabd2f";
        disabled = false;
      };

      conda = {
        symbol = " ";
        style = "bold fg:#d3869b";
        disabled = false;
      };

      nix_shell = {
        symbol = " ";
        style = "bold fg:#d3869b";
        disabled = false;
      };

      time = {
        format = "[$time](bold fg:#d3869b) ";
        time_format = "%F %T";
        style = "bold fg:#d3869b";
      };

      character = {
        symbol = "➜ ";
        style = "bold fg:#fabd2f";
        error_symbol = "✗ ";
        use_symbol_for_status = true;
      };
    };
  };
}
