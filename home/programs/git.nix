{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    git
  ];
  # programs.git = {
  #   enable = true;
  #   extraConfig = {
  #     init = {
  #       defaultBranch = "main";
  #     };
  #   };
  #   ignores = [ "*Session.vim" ];
  #   userName = "Bruno Anesio";
  #   userEmail = "69819132+brunoanesio@users.noreply.github.com";
  # };
}
