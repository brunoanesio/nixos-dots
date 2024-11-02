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
  ];
}
