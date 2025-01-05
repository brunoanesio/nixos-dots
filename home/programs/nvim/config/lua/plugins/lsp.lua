local lspconfig = require "lspconfig"
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      telemetry = { enable = false },
      completion = { callSnippet = "Replace" },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.tbl_deep_extend("force", vim.api.nvim_get_runtime_file("", true), {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
        }),
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
      format = {
        enable = false,
      },
    },
  },
}

lspconfig.nil_ls.setup {
  capabilities = capabilities,
  settings = {
    ["nil"] = { formatting = { command = { "nixfmt" } } },
  },
}

lspconfig.gopls.setup {
  capabilities = capabilities,
  settings = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
      unusedparams = true,
    },
  },
}

lspconfig.basedpyright.setup {
  capabilities = capabilities,
  settings = {
    analysys = {
      typeCheckingMode = "basic",
      enableTypeIgnoreComments = false,
      logLevel = "error",
      autoImportCompletions = true,
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      useLibraryCodeForTypes = true,
      inlayHints = { variableTypes = true },
    },
  },
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  settings = {
    init_options = { allowTrailingCommas = true, allowComments = true, provideFormatter = false },
  },
}

lspconfig.bashls.setup {
  capabilities = capabilities,
}
lspconfig.ruff.setup {
  capabilities = capabilities,
}
lspconfig.clangd.setup {
  capabilities = capabilities,
}
lspconfig.cssls.setup {
  capabilities = capabilities,
}
