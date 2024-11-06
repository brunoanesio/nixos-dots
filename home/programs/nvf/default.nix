{ inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];
  programs.nvf = {
    enable = true;
    settings = {
      vim.lsp = {
        enable = true;
      };
      vim.languages = {
        nix.enable = true;
      };
    };
  };
}
