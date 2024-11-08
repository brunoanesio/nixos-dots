{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    python3
    go
    clang
    cargo
    nixfmt-rfc-style
    lazygit
    neovim
    gh
  ];

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
        helper = "!/etc/profiles/per-user/artic/bin/gh auth git-credential";
      };
    };
    ignores = [ "*Session.vim" ];
    userName = "Bruno Anesio";
    userEmail = "69819132+brunoanesio@users.noreply.github.com";
  };
}
