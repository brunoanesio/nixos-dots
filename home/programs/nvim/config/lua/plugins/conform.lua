require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    scss = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    yaml = { "prettierd" },
    python = { "ruff_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    cpp = { "clang-format" },
    rust = { "rustfmt" },
    toml = { "taplo" },
  },
  formatters = {
    golines = {
      prepend_args = { "--max-len=80" },
    },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
