{ inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim.visuals = {
        enable = true;
        cursorline.enable = true;
      };
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };
      vim.lsp = {
        enable = true;
      };
      vim.languages = {
        nix.enable = true;
      };
    };
  };
}
