{ ... }: {
  # starship - The minimal, blazing-fast, and infinitely customizable prompt for any shell!
  programs.starship = {
    enable = true;
    settings = {
      format = "[░▒▓](#a6adc8)[  ](bg:#a6adc8 fg:#1e1e2e)$hostname[](bg:#89b4fa fg:#a6adc8)$directory[](fg:#89b4fa bg:#585b70)$git_branch$git_status[](fg:#585b70 bg:#45475a)$nodejs$rust$golang$php$gcloud$conda$nix_shell[](fg:#45475a bg:#313244)$time[ ](fg:#313244)\n$character";

      hostname = {
        ssh_only = false;
        style = "bg:#a6adc8 fg:#1e1e2e";
        format = "[$hostname]($style)";
      };

      directory = {
        style = "fg:#f5e0dc bg:#89b4fa";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:#585b70";
        format = "[[ $symbol $branch ](fg:#89b4fa bg:#585b70)]($style)";
      };

      git_status = {
        style = "bg:#585b70";
        format = "[[($all_status$ahead_behind )](fg:#89b4fa bg:#585b70)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#45475a";
        format = "[[ $symbol ($version) ](fg:#89b4fa bg:#45475a)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#45475a";
        format = "[[ $symbol ($version) ](fg:#89b4fa bg:#45475a)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#45475a";
        format = "[[ $symbol ($version) ](fg:#89b4fa bg:#45475a)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:#45475a";
        format = "[[ $symbol ($version) ](fg:#89b4fa bg:#45475a)]($style)";
      };

      gcloud = {
        symbol = "";
        style = "bg:#45475a";
        format = "[[ $symbol ($account@$project) ](fg:#89b4fa bg:#45475a)]($style)";
      };

      conda = {
        symbol = "";
        style = "bg:#45475a";
        format = "[[ $symbol $environment ](fg:#89b4fa bg:#45475a)]($style)";
      };

      nix_shell = {
        symbol = "";
        style = "bg:#45475a";
        format = "[[ $symbol ($name) ](fg:#89b4fa bg:#45475a)]($style)";
        disabled = false;
      };

      time = {
        disabled = false;
        time_format = "%F %T";
        style = "bg:#313244";
        format = "[[  $time ](fg:#cdd6f4 bg:#313244)]($style)";
      };
    };
  };

}

