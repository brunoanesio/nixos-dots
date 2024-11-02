{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(zoxide init --cmd cd bash)"
      export PATH="$PATH:$HOME/.local/bin"
    '';
  };
}
