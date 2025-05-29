{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      indent-blankline-nvim
      nvim-lspconfig
      nvim-treesitter
      plenary-nvim
      lazygit-nvim
      gitsigns-nvim
      conform-nvim
      fidget-nvim
      mini-nvim
      nvim-cmp
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      windsurf-nvim
      luasnip
      friendly-snippets
    ];
    extraPackages = with pkgs; [
      lua-language-server
      shellcheck
      ruff
      bash-language-server
      codeium
      prettierd
      basedpyright
      clang-tools
      nil
      stylua
      shfmt
      taplo
      rustfmt
      vscode-langservers-extracted
      # nodePackages.vscode-json-languageserver
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
