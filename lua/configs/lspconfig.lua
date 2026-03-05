require("nvchad.configs.lspconfig").defaults()

-- Custom gopls setup
vim.lsp.config("gopls", {
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

local servers = {
  "html",
  "cssls",
  "clangd",
  "clojure_lsp",
  "elixirls",
  "yaml_ls",
  "ts_ls",
  "docker_compose_language_service",
  "dockerls",
  "jsonls",
  "gopls"
}

-- Enable all the servers
vim.lsp.enable(servers)
