{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    python3
    go
    clang
    cargo
    nixfmt-rfc-style
    gh
  ];

  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim".source = ./nvim;

  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = [
          "#89b4fa"
          "bold"
        ];
        inactiveBorderColor = [
          "#a6adc8"
        ];
        optionsTextColor = [
          "#89b4fa"
        ];
        selectedLineBgColor = [
          "#313244"
        ];
        cherryPickedCommitBgColor = [
          "#45475a"
        ];
        cherryPickedCommitFgColor = [
          "#89b4fa"
        ];
        unstagedChangesColor = [
          "#f38ba8"
        ];
        defaultFgColor = [
          "#cdd6f4"
        ];
        searchingActiveBorderColor = [
          "#f9e2af"
        ];
      };
      authorColors = {
        "*" = "#b4befe";
      };
    };
  };

  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        signingkey = "751694BF0684636D";
      };
      commit = {
        gpgsign = true;
      };
      credential = {
        helper = "!/etc/profiles/per-user/frost/bin/gh auth git-credential";
      };
    };
    ignores = [ "*Session.vim" ];
    userName = "Bruno Anesio";
    userEmail = "69819132+brunoanesio@users.noreply.github.com";
  };
}
