local opts = {
  -- sync_install = true,
  -- auto_install = true,

  -- ensure_installed = { "vimdoc", "lua", "go", "python", "css", "html", "json", "jsonc", "nix" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commenstring = {
    enable = true,
    enable_autocmd = false,
  },
}
require("nvim-treesitter").setup(opts)
