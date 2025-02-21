{ config, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    defaultKeymap = "emacs";
    historySubstringSearch = {
      enable = true;
      searchDownKey = "'^p'";
      searchUpKey = "'^n'";
    };
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion = {
      enable = true;
    };
    history = {
      append = true;
      share = true;
      save = 10000;
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      ignoreSpace = true;
      ignoreDups = true;
      ignoreAllDups = true;
    };
    initExtraBeforeCompInit = ''
      autoload -U colors && colors
    '';
    initExtra = ''
      eval "$(zoxide init --cmd cd zsh)"
      export PATH="$PATH:$HOME/.local/bin"
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu yes
    '';
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 1000;
      command_timeout = 1000;
      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
      };
      directory = {
        truncation_length = 4;
        style = "bold blue";
      };
      line_break = {
        disable = false;
      };
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        style = "bold lavender";
      };
      time = {
        format = "[$time]($style) ";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
      };
      python = {
        disabled = true;
      };
      lua = {
        disabled = true;
      };
    };
  };
}
